nascent_inpath="/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/iso_annot/"
teloprime_inpath="/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/"
outpath="/private/groups/brookslab/gabai/projects/yeastMeth/figures/"

gene_regions=("UBC13" "chrIV:629299-630655" 650)
## plot teloprime isoforms by splicing annotation
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
        --bam ${teloprime_inpath}260315_ys18_rep1_teloprime_iso_annotated_by_splicing_iso_annotated.bam \
        --bed /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
        --region ${new_region} \
        --sort start \
        --softclip \
        --output ${outpath}Figure4_ys18_rep1_teloprime_${gene_id}.pdf \
        --width 15 \
        --gene ${gene_id} \
        --plot-gene-only \
        --n-rows ${n_rows} \
        

    python /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260302_plot_isoforms.py \
        --bam ${teloprime_inpath}260315_ym209_rep1_teloprime_iso_annotated_by_splicing_iso_annotated.bam \
        --bed /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
        --region ${new_region} \
        --sort start \
        --softclip \
        --output ${outpath}Figure4_ym209_rep1_teloprime_${gene_id}.pdf \
        --width 15 \
        --gene ${gene_id} \
        --plot-gene-only \
        --n-rows ${n_rows} \
        
done

gene_regions=("UBC13" "chrIV:629299-630655" 150)
# nascent
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
        --bam ${nascent_inpath}260315_ys18_rep1_nRNA_iso_annotated_by_splicing_iso_annotated.bam \
        --bed /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
        --region ${new_region} \
        --sort start \
        --softclip \
        --output ${outpath}Figure4_ys18_rep1_nRNA_${gene_id}.pdf \
        --width 15 \
        --gene ${gene_id} \
        --plot-gene-only \
        --n-rows ${n_rows} \
        

    python /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260302_plot_isoforms.py \
        --bam ${nascent_inpath}260315_ym209_rep1_nRNA_iso_annotated_by_splicing_iso_annotated.bam \
        --bed /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
        --region ${new_region} \
        --sort start \
        --softclip \
        --output ${outpath}Figure4_ym209_rep1_nRNA_${gene_id}.pdf \
        --width 15 \
        --gene ${gene_id} \
        --plot-gene-only \
        --n-rows ${n_rows} \
        
done