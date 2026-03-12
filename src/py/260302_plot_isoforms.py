#!/usr/bin/env python3
"""
Visualize long-read RNA-seq reads and BED12 gene annotations for a genomic region.

Usage:
    python plot_lr_reads.py --bam reads.bam --bed genes.bed12 \
        --region chrI:100-5000 --sort start --softclip --output plot.pdf
"""

import argparse
from collections import defaultdict
import pysam
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np


def parse_region(region_str):
    chrom, coords = region_str.split(":")
    start, end = coords.replace(",", "").split("-")
    return chrom, int(start), int(end)


def read_bed12(bed_file, chrom, start, end):
    genes = []
    with open(bed_file) as f:
        for line in f:
            if line.startswith(("#", "track", "browser")):
                continue
            fields = line.strip().split("\t")
            if len(fields) < 12:
                continue
            g_chrom, g_start, g_end = fields[0], int(fields[1]), int(fields[2])
            if g_chrom != chrom or g_end < start or g_start > end:
                continue
            block_sizes = [int(x) for x in fields[10].strip(",").split(",") if x]
            block_starts = [int(x) for x in fields[11].strip(",").split(",") if x]
            exons = [
                (g_start + bs, g_start + bs + bz)
                for bs, bz in zip(block_starts, block_sizes)
            ]
            genes.append(
                {
                    "name": fields[3],
                    "start": g_start,
                    "end": g_end,
                    "strand": fields[5],
                    "exons": exons,
                }
            )
    return genes


def cigar_blocks(read, show_softclip=False):
    """Return (aligned_blocks, softclip_blocks) from CIGAR.
    Deletions (D) are absorbed into the current block; only N (intron) splits blocks.
    Clips are returned as (start, end, bases) when show_softclip is True.
    """
    blocks, clips = [], []
    if read.cigartuples is None:
        return blocks, clips
    ref = read.reference_start
    query_pos = 0
    block_start = None
    seen_alignment = False
    seq = read.query_sequence if show_softclip else None
    for op, length in read.cigartuples:
        if op in (0, 7, 8):  # M, =, X — consume ref + query
            seen_alignment = True
            if block_start is None:
                block_start = ref
            ref += length
            query_pos += length
        elif op == 2:  # D — consume ref only
            if block_start is None:
                block_start = ref
            ref += length
        elif op == 3:  # N — intron, close current block
            if block_start is not None:
                blocks.append((block_start, ref))
                block_start = None
            ref += length
        elif op == 4:  # S — consume query only
            if block_start is not None:
                blocks.append((block_start, ref))
                block_start = None
            if show_softclip:
                bases = seq[query_pos:query_pos + length] if seq else ""
                if not seen_alignment:
                    clips.append((ref - length, ref, bases))
                else:
                    clips.append((ref, ref + length, bases))
            query_pos += length
        elif op == 1:  # I — consume query only
            query_pos += length
        elif op == 5:  # H — hard clip, no consumption
            pass
    if block_start is not None:
        blocks.append((block_start, ref))
    return blocks, clips


def parse_read_name(read_name):
    """Extract (gene_id, isoform_type) from read name.
    e.g. '62:526|xxx:YAL065C:antisense' -> ('YAL065C', 'antisense')
    """
    parts = read_name.split(":")
    if len(parts) >= 3:
        return parts[-2], parts[-1]
    if len(parts) == 2:
        return "unknown", parts[-1]
    return "unknown", "unknown"


PALETTE = ["#B25D91FF", "#5E8C61FF", "#FFC857FF"]
color_map = dict(zip(
    ["canonical", "downstream", "antisense"],
    PALETTE,
))

ISO_ORDER = {"canonical": 0, "downstream": 1, "antisense": 2}

BASE_COLORS = {
    "A": "#00C800",
    "C": "#0000C8",
    "G": "#C88B14",
    "T": "#FF0000",
    "N": "#808080",
}

def make_arrow_verts(x_start, x_end, y, height, tip_size, direction):
    """Return vertices for a pentagon (arrow) polygon indicating strand."""
    if direction == "right":
        body_end = max(x_end - tip_size, x_start)
        return [
            (x_start, y),
            (body_end, y),
            (x_end, y + height / 2),
            (body_end, y + height),
            (x_start, y + height),
        ]
    body_start = min(x_start + tip_size, x_end)
    return [
        (x_end, y + height),
        (body_start, y + height),
        (x_start, y + height / 2),
        (body_start, y),
        (x_end, y),
    ]


def pack_rows(reads):
    """Greedy interval packing; returns y-index per read."""
    row_ends = []
    y = []
    for r in reads:
        placed = False
        for i, rend in enumerate(row_ends):
            if r["start"] >= rend:
                row_ends[i] = r["end"]
                y.append(i)
                placed = True
                break
        if not placed:
            row_ends.append(r["end"])
            y.append(len(row_ends) - 1)
    return y


def plot_region(
    bam_file, bed_file, region, sort_by="start",
    show_softclip=False, output="reads_plot.pdf",
    figwidth=14, read_height=0.15,
    gene=None, plot_gene_only=False,
):
    chrom, reg_start, reg_end = parse_region(region)
    genes = read_bed12(bed_file, chrom, reg_start, reg_end)

    # ── Gene strand lookup from annotations ─────────────────────────────────
    gene_strand = {g["name"]: g["strand"] for g in genes}

    # ── Collect reads ─────────────────────────────────────────────────────────
    reads_data = []
    with pysam.AlignmentFile(bam_file, "rb") as samfile:
        for read in samfile.fetch(chrom, reg_start, reg_end):
            if not read.is_mapped or read.is_supplementary or read.is_secondary:
                continue
            blocks, clips = cigar_blocks(read, show_softclip)
            if not blocks:
                continue
            all_pos = [p for b in blocks for p in b]
            if show_softclip and clips:
                all_pos += [p for cs, ce, _ in clips for p in (cs, ce)]
            gene_id, iso_type = parse_read_name(read.query_name)
            reads_data.append(
                {
                    "blocks": blocks,
                    "clips": clips,
                    "gene_id": gene_id,
                    "isoform_type": iso_type,
                    "start": min(all_pos),
                    "end": max(all_pos),
                    "is_reverse": read.is_reverse,
                }
            )

    # ── Filter / prioritize by --gene ──────────────────────────────────────
    if plot_gene_only and gene:
        reads_data = [rd for rd in reads_data if rd["gene_id"] == gene]

    # ── Group by (gene, isoform_type), then sort strand-aware ─────────────
    groups = defaultdict(list)
    for rd in reads_data:
        groups[(rd["gene_id"], rd["isoform_type"])].append(rd)

    def group_sort_key(item):
        gid, iso = item[0]
        iso_rank = ISO_ORDER.get(iso, 99)
        if gene:
            return (0 if gid == gene else 1, iso_rank, gid, iso)
        return (iso_rank, gid, iso)

    reads_data = []
    for (gid, iso), group in sorted(groups.items(), key=group_sort_key):
        strand = gene_strand.get(gid, "+")
        effective_strand = strand
        if iso == "antisense":
            effective_strand = "-" if strand == "+" else "+"
        if sort_by == "start":
            if effective_strand == "+":
                group.sort(key=lambda r: r["start"])
            else:
                group.sort(key=lambda r: r["end"], reverse=True)
        else:  # sort_by == "end"
            if effective_strand == "+":
                group.sort(key=lambda r: r["end"])
            else:
                group.sort(key=lambda r: r["start"], reverse=True)
        reads_data.extend(group)

    y_pos = list(range(len(reads_data)))
    n_rows = len(reads_data)

    # ── Layout ────────────────────────────────────────────────────────────────
    gene_h = max(len(genes), 1) * 0.5 + 0.3
    read_h = min(max(n_rows * 0.02 + 0.5, 2), figwidth * 0.6)

    fig, (ax_g, ax_r) = plt.subplots(
        2, 1, figsize=(figwidth, gene_h + read_h),
        gridspec_kw={"height_ratios": [gene_h, read_h]},
        sharex=True,
    )

    # ── Gene annotation panel ─────────────────────────────────────────────────
    for i, g in enumerate(genes):
        y = i
        ax_g.plot(
            [g["start"], g["end"]], [y, y],
            color="#333333", linewidth=0.4, zorder=1,
        )
        for es, ee in g["exons"]:
            ax_g.add_patch(
                plt.Rectangle(
                    (es, y - 0.15), ee - es, 0.3,
                    facecolor="#2c3e50", edgecolor="#2c3e50", zorder=2,
                )
            )
        # strand arrows
        arrow = ">" if g["strand"] == "+" else "<"
        mid = (max(g["start"], reg_start) + min(g["end"], reg_end)) / 2
        fontsize = 12
        ax_g.text(
            mid, y, arrow, fontsize=12, color="white",
            ha="center", va="center", zorder=3, fontweight="bold",
        )
        ax_g.text(
            max(g["start"], reg_start), y + 0.45,
            f"{g['name']} ({g['strand']})",
            fontsize=12, va="bottom", ha="left", style="italic",
        )

    ax_g.set_ylim(-0.8, max(len(genes), 1) - 0.2 + 0.8)
    ax_g.set_ylabel("Genes")
    ax_g.set_yticks([])
    ax_g.set_title(f"{chrom}:{reg_start:,}-{reg_end:,}  ({len(reads_data)} reads)")
    ax_g.spines[["top", "right"]].set_visible(False)

    # ── Read panel ────────────────────────────────────────────────────────────
    spacing = read_height + 0.01
    tip_size = (reg_end - reg_start) * 0.004
    for rd, yr in zip(reads_data, y_pos):
        y = yr * spacing
        col = color_map.get(rd["isoform_type"], "#999999")
        is_rev = rd["is_reverse"]
        blocks = rd["blocks"]
        clips = rd["clips"]

        # Partition clips: arrow-end clip merges into the pentagon
        arrow_clip = None
        other_clips = []
        for c in clips:
            if is_rev and c[1] <= blocks[0][0]:
                arrow_clip = c
            elif not is_rev and c[0] >= blocks[-1][1]:
                arrow_clip = c
            else:
                other_clips.append(c)

        term_idx = 0 if is_rev else len(blocks) - 1
        direction = "left" if is_rev else "right"

        for j, (bs, be) in enumerate(blocks):
            if j == term_idx:
                if arrow_clip:
                    if is_rev:
                        arr_start, arr_end = arrow_clip[0], be
                    else:
                        arr_start, arr_end = bs, arrow_clip[1]
                else:
                    arr_start, arr_end = bs, be
                verts = make_arrow_verts(
                    arr_start, arr_end, y, read_height, tip_size, direction)
                poly = mpatches.Polygon(
                    verts, facecolor=col, edgecolor="none", zorder=2)
                ax_r.add_patch(poly)
                if arrow_clip:
                    cs, ce, bases = arrow_clip
                    for k, base in enumerate(bases):
                        ax_r.add_patch(plt.Rectangle(
                            (cs + k, y), 1, read_height,
                            facecolor=BASE_COLORS.get(base.upper(), "#808080"),
                            edgecolor="none", zorder=3,
                        ))
            else:
                ax_r.add_patch(
                    plt.Rectangle(
                        (bs, y), be - bs, read_height,
                        facecolor=col, edgecolor="none", zorder=2,
                    )
                )

        # intron connector lines
        for j in range(len(blocks) - 1):
            ax_r.plot(
                [blocks[j][1], blocks[j + 1][0]],
                [y + read_height / 2] * 2,
                color=col, linewidth=0.5, zorder=1,
            )

        # non-arrow soft-clip bases (IGV-style per-nucleotide coloring)
        for cs, ce, bases in other_clips:
            for k, base in enumerate(bases):
                ax_r.add_patch(
                    plt.Rectangle(
                        (cs + k, y), 1, read_height,
                        facecolor=BASE_COLORS.get(base.upper(), "#808080"),
                        edgecolor="none", zorder=2,
                    )
                )

    ax_r.set_ylim(n_rows * spacing + 0.2, -0.2)
    ax_r.set_xlim(reg_start, reg_end)
    ax_r.set_xlabel(f"Position on {chrom} (bp)")
    ax_r.set_ylabel(f"Reads (sorted by {sort_by})")
    ax_r.set_yticks([])
    ax_r.spines[["top", "right"]].set_visible(False)

    iso_handles = [mpatches.Patch(color=color_map[t], label=t)
                   for t in ["canonical", "downstream", "antisense"]]
    base_handles = [mpatches.Patch(color=BASE_COLORS[b], label=b)
                    for b in "ACGT"]
    leg_base = ax_r.legend(
        handles=base_handles, loc="lower left", fontsize=8,
        title="Soft-clip bases", title_fontsize=9, framealpha=0.9,
    )
    ax_r.add_artist(leg_base)

    plt.tight_layout()
    fig.canvas.draw()
    bb = leg_base.get_window_extent().transformed(ax_r.transAxes.inverted())
    ax_r.legend(
        handles=iso_handles, loc="lower left", fontsize=8,
        title="Isoforms", title_fontsize=9, framealpha=0.9,
        bbox_to_anchor=(0.0, bb.y1),
    )
    plt.savefig(output, bbox_inches="tight")
    plt.close()
    print(f"Saved {len(reads_data)} reads to {output}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Visualize long-read RNA BAM + BED12 annotations"
    )
    parser.add_argument("--bam", required=True, help="Indexed BAM file")
    parser.add_argument("--bed", required=True, help="BED12 annotation file")
    parser.add_argument("--region", required=True, help="chrom:start-end")
    parser.add_argument(
        "--sort", default="start", choices=["start", "end"],
        help="Sort reads by start or end (default: start)",
    )
    parser.add_argument(
        "--softclip", action="store_true",
        help="Show soft-clipped portions (translucent)",
    )
    parser.add_argument("--output", default="reads_plot.pdf", help="Output file")
    parser.add_argument("--width", type=float, default=14, help="Figure width (inches)")
    parser.add_argument(
        "--read-height", type=float, default=0.08, help="Read bar height",
    )
    parser.add_argument(
        "--gene", default=None,
        help="Gene name to prioritize (plotted first)",
    )
    parser.add_argument(
        "--plot-gene-only", action="store_true",
        help="Only plot reads annotated as --gene (requires --gene)",
    )
    args = parser.parse_args()

    if args.plot_gene_only and not args.gene:
        parser.error("--plot-gene-only requires --gene")

    plot_region(
        bam_file=args.bam,
        bed_file=args.bed,
        region=args.region,
        sort_by=args.sort,
        show_softclip=args.softclip,
        output=args.output,
        figwidth=args.width,
        read_height=args.read_height,
        gene=args.gene,
        plot_gene_only=args.plot_gene_only,
    )
