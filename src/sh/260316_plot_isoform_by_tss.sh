outpath="/private/groups/brookslab/gabai/projects/yeastMeth/figures/"
gene_gtf="/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/260311_genes_of_interest_ares_v13.bed"


# geneids=("SPO19" "RRD1" "MAP1")

########################################################
### plot isoforms
########################################################

nascent_inpath="/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/iso_annot/"
teloprime_inpath="/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/"

# gene_regions=("RRD1" "chrIX:55021-56429" 400 "MAP1" "chrXII:625117-626501" 2500 "SPO19" "chrXVI:304014-305108" 40)
gene_regions=("ZWF1" "chrXIV:196375-198443" 400)
## plot nascent isoforms by tss annotation
# for nascent
# gene_regions=("RRD1" "chrIX:55021-56429" 150)
# extend=0

# for i in $(seq 0 3 $(( ${#gene_regions[@]} - 3 ))); do
#     gene_id=${gene_regions[$i]}
#     region=${gene_regions[$(( i + 1 ))]}

#     n_rows=${gene_regions[$(( i + 2 ))]}

#     chrom=${region%%:*}                        # chrIV
#     coords=${region##*:}                       # 34186-36796
#     start=${coords%-*}                         # 34186
#     end=${coords##*-}                          # 36796

#     new_start=$(( start - extend ))
#     new_end=$(( end + extend ))

#     new_start=$(( new_start < 0 ? 0 : new_start ))

#     new_region="${chrom}:${new_start}-${new_end}"

#     echo "${gene_id} ${new_region}"
#     python /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260302_plot_isoforms.py \
#         --bam ${nascent_inpath}260302_ys18_rep1_nRNA_final_pass_iso_annotated_by_tss_iso_annotated.bam \
#         --bed /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
#         --region ${new_region} \
#         --sort start \
#         --softclip \
#         --output ${outpath}Figure3_ys18_rep1_nascent_${gene_id}.pdf \
#         --width 6 \
#         --read-height 0.1 \
#         --gene ${gene_id} \
#         --n-rows ${n_rows} \
#         --plot-gene-only

#     python /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260302_plot_isoforms.py \
#         --bam ${nascent_inpath}260302_ym209_rep1_nRNA_final_pass_iso_annotated_by_tss_iso_annotated.bam \
#         --bed /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
#         --region ${new_region} \
#         --sort start \
#         --softclip \
#         --output ${outpath}Figure3_ym209_rep1_nascent_${gene_id}.pdf \
#         --width 6 \
#         --read-height 0.1 \
#         --gene ${gene_id} \
#         --n-rows ${n_rows} \
#         --plot-gene-only

# done

## plot teloprime isoforms by tss annotation
extend=0

for i in $(seq 0 3 $(( ${#gene_regions[@]} - 3 ))); do
    gene_id=${gene_regions[$i]}
    region=${gene_regions[$(( i + 1 ))]}
    n_rows=${gene_regions[$(( i + 2 ))]}

    chrom=${region%%:*}                        # chrIV
    coords=${region##*:}                       # 34186-36796
    start=${coords%-*}                         # 34186
    end=${coords##*-}                          # 36796

    new_start=$(( start - extend ))
    new_end=$(( end + extend ))

    new_start=$(( new_start < 0 ? 0 : new_start ))

    new_region="${chrom}:${new_start}-${new_end}"
    
    echo "${gene_id} ${new_region}"
    python /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260302_plot_isoforms.py \
        --bam ${teloprime_inpath}260302_ys18_rep1_teloprime_iso_annotated_by_tss_iso_annotated.bam \
        --bed /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
        --region ${new_region} \
        --sort start \
        --softclip \
        --output ${outpath}Figure3_ys18_rep1_teloprime_${gene_id}.pdf \
        --width 6 \
        --gene ${gene_id} \
        --read-height 0.1 \
        --n-rows ${n_rows} \
        --plot-gene-only
    
    # --bam ${teloprime_inpath}260302_ym209_rep1_teloprime_iso_annotated_by_tss_iso_annotated.bam \
    python /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260302_plot_isoforms.py \
        --bam ${teloprime_inpath}downsample/ym209_rep1_0.6.sorted.bam \
        --bed /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
        --region ${new_region} \
        --sort start \
        --softclip \
        --output ${outpath}Figure3_ym209_rep1_teloprime_${gene_id}.pdf \
        --width 6 \
        --gene ${gene_id} \
        --read-height 0.1 \
        --n-rows ${n_rows} \
        --plot-gene-only

    python /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260302_plot_isoforms.py \
        --bam ${teloprime_inpath}260302_ys18_rep2_teloprime_iso_annotated_by_tss_iso_annotated.bam \
        --bed /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
        --region ${new_region} \
        --sort start \
        --softclip \
        --output ${outpath}Figure3_ys18_rep2_teloprime_${gene_id}.pdf \
        --width 6 \
        --read-height 0.1 \
        --gene ${gene_id} \
        --n-rows ${n_rows} \
        --plot-gene-only

    # --bam ${teloprime_inpath}260302_ym209_rep2_teloprime_iso_annotated_by_tss_iso_annotated.bam \
    python /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260302_plot_isoforms.py \
        --bam ${teloprime_inpath}downsample/ym209_rep2_0.4.sorted.bam \
        --bed /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
        --region ${new_region} \
        --sort start \
        --softclip \
        --output ${outpath}Figure3_ym209_rep2_teloprime_${gene_id}.pdf \
        --width 6 \
        --read-height 0.1 \
        --gene ${gene_id} \
        --n-rows ${n_rows} \
        --plot-gene-only
        
done

