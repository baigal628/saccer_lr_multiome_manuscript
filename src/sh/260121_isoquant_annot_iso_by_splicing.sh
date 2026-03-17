# nascent RNA isoform quantification by splicing annotation
python3 /private/groups/brookslab/gabai/tools/epiflair/src/isoQuant.py \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_merged.pass.sorted.bam \
    -s ys18_rep1 ys18_rep2 ym209_rep1 ym209_rep2 \
    -r /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_extended_sorted.bed \
    -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/isoquant/ \
    -p 260121_nRNA_tx_alignment_annot_by_splicing \
    --annot_tx_by_splicing \
    --tx_alignment \
    --add_isoannot \


# teloprime RNA isoform quantification by splicing annotation
python3 /private/groups/brookslab/gabai/tools/epiflair/src/isoQuant.py \
     -b \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ys18_rep1_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ys18_rep2_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ys18_rep3_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ym209_rep1_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ym209_rep2_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ym209_rep3_trimmed_merged.pass.sorted.bam \
    -s ys18_rep1 ys18_rep2 ys18_rep3 ym209_rep1 ym209_rep2 ym209_rep3 \
    -r /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_extended_sorted.bed \
    -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/isoquant/ \
    -p 260121_teloprime_tx_alignment_annot_by_splicing \
    --annot_tx_by_splicing \
    --tx_alignment \
    --add_isoannot


# test out a single read
########################################################
ref=/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_extended_flairome.fa
fqdir=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/filtered_fastq
txdir=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment

fq=$fqdir/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_final.pass.fastq

# Step 1: align with --for-only
for_only_bam=$txdir/250919_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_for_only.pass.sorted.bam

minimap2 -ax map-ont -t 20 --for-only "$ref" "$fq" \
    | samtools sort -@ 20 -o "$for_only_bam"

samtools view "$for_only_bam" | grep -e "75:416|8acee5cf-3d5e-4c0f-a99f-95497571f85e"



