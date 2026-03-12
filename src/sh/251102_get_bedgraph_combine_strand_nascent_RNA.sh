python3 /private/groups/brookslab/gabai/tools/epiflair/src/gene_end_wig.py \
    -gb \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_final.pass.sorted.bam \
    -tb \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_merged.pass.sorted_annot_iso_by_tss.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/251102_tss_tts/ \
    -p 251102_nascent_genomic_alignment_ys18_rep1 \
    --annot_iso

python3 /private/groups/brookslab/gabai/tools/epiflair/src/gene_end_wig.py \
    -gb \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_final.pass.sorted.bam \
    -tb \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_merged.pass.sorted_annot_iso_by_tss.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/251102_tss_tts/ \
    -p 251102_nascent_genomic_alignment_ys18_rep2 \
    --annot_iso

python3 /private/groups/brookslab/gabai/tools/epiflair/src/gene_end_wig.py \
    -gb \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_final.pass.sorted.bam \
    -tb \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_merged.pass.sorted_annot_iso_by_tss.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/251102_tss_tts/ \
    -p 251102_nascent_genomic_alignment_ym209_rep1 \
    --annot_iso

python3 /private/groups/brookslab/gabai/tools/epiflair/src/gene_end_wig.py \
    -gb \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_final.pass.sorted.bam \
    -tb \
        /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_merged.pass.sorted_annot_iso_by_tss.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/251102_tss_tts/ \
    -p 251102_nascent_genomic_alignment_ym209_rep2 \
    --annot_iso