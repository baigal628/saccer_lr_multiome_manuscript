# nascent RNA isoform quantification by tss annotation
python3 /private/groups/brookslab/gabai/tools/epiflair/src/isoQuant.py \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_merged.pass.sorted.bam \
    -s ys18_rep1 ys18_rep2 ym209_rep1 ym209_rep2 \
    -r /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_extended_sorted.bed \
    -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/isoquant/ \
    -p 250920_nRNA_tx_alignment_annot_by_tss \
    --annot_tx_by_start \
    --add_isoannot \
    --tx_alignment


python3 /private/groups/brookslab/gabai/tools/epiflair/src/isoQuant.py \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_merged.pass.sorted.bam \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_merged.pass.sorted.bam \
    -s ys18_rep1 ys18_rep2 ym209_rep1 ym209_rep2 \
    -r /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_extended_sorted.bed \
    -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/isoquant/ \
    -p 250925_nRNA_tx_alignment \
    --tx_alignment