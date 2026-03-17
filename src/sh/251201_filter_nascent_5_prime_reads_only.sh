tss_bed="/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/251102_tss_tts/251201_nascent_genomic_alignment_ys18_rep1_canonical_isoform.bed"
# ys18 rep1
python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_final.pass.sorted.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_final_5prime_only.pass.sorted.bam \
    --tss_bed $tss_bed

samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_final_5prime_only.pass.sorted.bam

# ys18 rep2
python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_final.pass.sorted.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_final_5prime_only.pass.sorted.bam \
    --tss_bed $tss_bed
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_final_5prime_only.pass.sorted.bam

# ym209 rep1
python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_final.pass.sorted.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_final_5prime_only.pass.sorted.bam \
    --tss_bed $tss_bed
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_final_5prime_only.pass.sorted.bam

# ym209 rep2
python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_final.pass.sorted.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_final_5prime_only.pass.sorted.bam \
    --tss_bed $tss_bed

# samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_final_5prime_only.pass.sorted.bam   