inpath="/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/251102_tss_tts/"

# ys18 rep1
python3 /private/groups/brookslab/gabai/tools/epiflair/src/collapse_bedgraph_to_bed.py \
    -bdg ${inpath}251102_nascent_genomic_alignment_ys18_rep1_tss.bedGraph

grep -e "canonical" ${inpath}251102_nascent_genomic_alignment_ys18_rep1_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ys18_rep1_canonical_isoform.bed

grep -e "downstream" ${inpath}251102_nascent_genomic_alignment_ys18_rep1_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ys18_rep1_downstream_isoform.bed

grep -e "antisense" ${inpath}251102_nascent_genomic_alignment_ys18_rep1_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ys18_rep1_antisense_isoform.bed

# ys18 rep2
python3 /private/groups/brookslab/gabai/tools/epiflair/src/collapse_bedgraph_to_bed.py \
    -bdg ${inpath}251102_nascent_genomic_alignment_ys18_rep2_tss.bedGraph

grep -e "canonical" ${inpath}251102_nascent_genomic_alignment_ys18_rep2_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ys18_rep2_canonical_isoform.bed

grep -e "downstream" ${inpath}251102_nascent_genomic_alignment_ys18_rep2_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ys18_rep2_downstream_isoform.bed
grep -e "antisense" ${inpath}251102_nascent_genomic_alignment_ys18_rep2_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ys18_rep2_antisense_isoform.bed

# ym209 rep1
python3 /private/groups/brookslab/gabai/tools/epiflair/src/collapse_bedgraph_to_bed.py \
    -bdg ${inpath}251102_nascent_genomic_alignment_ym209_rep1_tss.bedGraph
grep -e "canonical" ${inpath}251102_nascent_genomic_alignment_ym209_rep1_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ym209_rep1_canonical_isoform.bed
grep -e "downstream" ${inpath}251102_nascent_genomic_alignment_ym209_rep1_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ym209_rep1_downstream_isoform.bed
grep -e "antisense" ${inpath}251102_nascent_genomic_alignment_ym209_rep1_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ym209_rep1_antisense_isoform.bed

# ym209 rep2
python3 /private/groups/brookslab/gabai/tools/epiflair/src/collapse_bedgraph_to_bed.py \
    -bdg ${inpath}251102_nascent_genomic_alignment_ym209_rep2_tss.bedGraph
grep -e "canonical" ${inpath}251102_nascent_genomic_alignment_ym209_rep2_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ym209_rep2_canonical_isoform.bed
grep -e "downstream" ${inpath}251102_nascent_genomic_alignment_ym209_rep2_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ym209_rep2_downstream_isoform.bed
grep -e "antisense" ${inpath}251102_nascent_genomic_alignment_ym209_rep2_tss.bed | \
    sort -k1,1 -k2,2n > ${inpath}251201_nascent_genomic_alignment_ym209_rep2_antisense_isoform.bed

