inpath='/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment'
cage_bed='/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/cage/DRR524315_findPeaks_h4_d5_sorted.bed'

## ys18 rep1
samtools view -@ 8 ${inpath}/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_final.pass.sorted.bam | cut -f1 | sort -u > ${inpath}/ys18_rep1_final_reads.txt

samtools view -@ 8 ${inpath}/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_final.pass.sorted.bam | cut -f1 | sort -u > ${inpath}/ys18_rep2_final_reads.txt

samtools view -@ 8 ${inpath}/250915_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_final.pass.sorted.bam | cut -f1 | sort -u > ${inpath}/ym209_rep1_final_reads.txt

samtools view -@ 8 ${inpath}/250915_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_final.pass.sorted.bam | cut -f1 | sort -u > ${inpath}/ym209_rep2_final_reads.txt

# precision recall
python3 /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260227_precision_recall_nascent_rna.py \
    --bam_file ${inpath}/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_final.pass.sorted.bam \
    --tss_beds ${cage_bed} \
    --outdir ${inpath} \
    --prefix 260227_precision_recall_final_nascent_rna_ys18_rep1

python3 /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260227_precision_recall_nascent_rna.py \
    --bam_file ${inpath}/no_cap/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed.pass.sorted.nocap.bam \
    --tss_beds ${cage_bed} \
    --reads_to_exclude ${inpath}/ys18_rep1_final_reads.txt \
    --outdir ${inpath} \
    --prefix 260227_precision_recall_no_cap_nascent_rna_ys18_rep1

# ys18 rep2
python3 /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260227_precision_recall_nascent_rna.py \
    --bam_file ${inpath}/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_final.pass.sorted.bam \
    --tss_beds ${cage_bed} \
    --outdir ${inpath} \
    --prefix 260227_precision_recall_final_nascent_rna_ys18_rep2

python3 /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260227_precision_recall_nascent_rna.py \
    --bam_file ${inpath}/no_cap/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmed.pass.sorted.nocap.bam \
    --tss_beds ${cage_bed} \
    --reads_to_exclude ${inpath}/ys18_rep2_final_reads.txt \
    --outdir ${inpath} \
    --prefix 260227_precision_recall_no_cap_nascent_rna_ys18_rep2

# jaccard index
# ys18 rep1
python3 /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260227_jaccard_index_nascent_rna.py \
    --bam_file ${inpath}/250908_RiboPool_LSK114_ys18_rep1_nRNA_trimmed.sorted.bam \
    --tss_beds ${cage_bed} \
    --outdir ${inpath} \
    --prefix 260227_jaccard_index_total_reads_nascent_rna_ys18_rep1

python3 /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260227_jaccard_index_nascent_rna.py \
    --bam_file ${inpath}/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_final.pass.sorted.bam \
    --tss_beds ${cage_bed} \
    --outdir ${inpath} \
    --prefix 260227_jaccard_index_final_nascent_rna_ys18_rep1

python3 /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260227_jaccard_index_nascent_rna.py \
    --bam_file ${inpath}/no_cap/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed.pass.sorted.nocap.bam \
    --tss_beds ${cage_bed} \
    --reads_to_exclude ${inpath}/ys18_rep1_final_reads.txt \
    --outdir ${inpath} \
    --prefix 260227_jaccard_index_no_cap_nascent_rna_ys18_rep1

# ys18 rep2
python3 /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260227_jaccard_index_nascent_rna.py \
    --bam_file ${inpath}/250908_RiboPool_LSK114_ys18_rep2_nRNA_trimmed.sorted.bam \
    --tss_beds ${cage_bed} \
    --outdir ${inpath} \
    --prefix 260227_jaccard_index_total_reads_nascent_rna_ys18_rep2

python3 /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260227_jaccard_index_nascent_rna.py \
    --bam_file ${inpath}/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_final.pass.sorted.bam \
    --tss_beds ${cage_bed} \
    --outdir ${inpath} \
    --prefix 260227_jaccard_index_final_nascent_rna_ys18_rep2

python3 /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/260227_jaccard_index_nascent_rna.py \
    --bam_file ${inpath}/no_cap/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmed.pass.sorted.nocap.bam \
    --tss_beds ${cage_bed} \
    --reads_to_exclude ${inpath}/ys18_rep2_final_reads.txt \
    --outdir ${inpath} \
    --prefix 260227_jaccard_index_no_cap_nascent_rna_ys18_rep2