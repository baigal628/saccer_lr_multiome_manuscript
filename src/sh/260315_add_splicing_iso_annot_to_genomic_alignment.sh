########################################################
# add splicing annotation to genomic alignment nascent
########################################################

# ys18_rep1
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam

python3 /private/groups/brookslab/gabai/tools/epiflair/src/add_isoannot_to_bam.py \
    -gb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_final.pass.sorted.bam \
    -tb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam \
    -p 260315_ys18_rep1_nRNA_iso_annotated_by_splicing \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/iso_annot/
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/iso_annot/260315_ys18_rep1_nRNA_iso_annotated_by_splicing_iso_annotated.bam

# ys18_rep2
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam
python3 /private/groups/brookslab/gabai/tools/epiflair/src/add_isoannot_to_bam.py \
    -gb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_final.pass.sorted.bam \
    -tb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam \
    -p 260315_ys18_rep2_nRNA_iso_annotated_by_splicing \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/iso_annot/
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/iso_annot/260315_ys18_rep2_nRNA_iso_annotated_by_splicing_iso_annotated.bam

# ym209_rep1
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam
python3 /private/groups/brookslab/gabai/tools/epiflair/src/add_isoannot_to_bam.py \
    -gb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_final.pass.sorted.bam \
    -tb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam \
    -p 260315_ym209_rep1_nRNA_iso_annotated_by_splicing \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/iso_annot/
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/iso_annot/260315_ym209_rep1_nRNA_iso_annotated_by_splicing_iso_annotated.bam

# ym209_rep2
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam
python3 /private/groups/brookslab/gabai/tools/epiflair/src/add_isoannot_to_bam.py \
    -gb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_final.pass.sorted.bam \
    -tb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250919_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam \
    -p 260315_ym209_rep2_nRNA_iso_annotated_by_splicing \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/iso_annot/
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/iso_annot/260315_ym209_rep2_nRNA_iso_annotated_by_splicing_iso_annotated.bam


########################################################
# add splicing annotation to genomic alignment teloprime
########################################################

# ys18_rep1
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ys18_rep1_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam
python3 /private/groups/brookslab/gabai/tools/epiflair/src/add_isoannot_to_bam.py \
    -gb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ys18_rep1_teloprime_trimmed.sorted.bam \
    -tb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ys18_rep1_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam \
    -p 260315_ys18_rep1_teloprime_iso_annotated_by_splicing \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/260315_ys18_rep1_teloprime_iso_annotated_by_splicing_iso_annotated.bam

# ys18_rep2
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ys18_rep2_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam
python3 /private/groups/brookslab/gabai/tools/epiflair/src/add_isoannot_to_bam.py \
    -gb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ys18_rep2_teloprime_trimmed.sorted.bam \
    -tb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ys18_rep2_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam \
    -p 260315_ys18_rep2_teloprime_iso_annotated_by_splicing \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/260315_ys18_rep2_teloprime_iso_annotated_by_splicing_iso_annotated.bam

# ys18_rep3
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ys18_rep3_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam
python3 /private/groups/brookslab/gabai/tools/epiflair/src/add_isoannot_to_bam.py \
    -gb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ys18_rep3_teloprime_trimmed.sorted.bam \
    -tb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ys18_rep3_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam \
    -p 260315_ys18_rep3_teloprime_iso_annotated_by_splicing \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/260315_ys18_rep3_teloprime_iso_annotated_by_splicing_iso_annotated.bam

# ym209_rep1
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ym209_rep1_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam
python3 /private/groups/brookslab/gabai/tools/epiflair/src/add_isoannot_to_bam.py \
    -gb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ym209_rep1_teloprime_trimmed.sorted.bam \
    -tb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ym209_rep1_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam \
    -p 260315_ym209_rep1_teloprime_iso_annotated_by_splicing \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/260315_ym209_rep1_teloprime_iso_annotated_by_splicing_iso_annotated.bam

# ym209_rep2
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ym209_rep2_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam
python3 /private/groups/brookslab/gabai/tools/epiflair/src/add_isoannot_to_bam.py \
    -gb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ym209_rep2_teloprime_trimmed.sorted.bam \
    -tb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ym209_rep2_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam \
    -p 260315_ym209_rep2_teloprime_iso_annotated_by_splicing \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/260315_ym209_rep2_teloprime_iso_annotated_by_splicing_iso_annotated.bam

# ym209_rep3
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ym209_rep3_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam
python3 /private/groups/brookslab/gabai/tools/epiflair/src/add_isoannot_to_bam.py \
    -gb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ym209_rep3_teloprime_trimmed.sorted.bam \
    -tb /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/tx_alignment/250920_teloprime_ym209_rep3_trimmed_merged.pass.sorted_annot_iso_by_splicing.bam \
    -p 260315_ym209_rep3_teloprime_iso_annotated_by_splicing \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/
samtools index /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/260315_ym209_rep3_teloprime_iso_annotated_by_splicing_iso_annotated.bam
