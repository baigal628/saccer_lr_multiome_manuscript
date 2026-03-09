#####
# Run on all datasets
#### 

python3 /private/groups/brookslab/gabai/tools/epiflair/src/count_nuc.py \
    -gt /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
    -nuc /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250331_cutoff125_ys18_150UNuc_Rep1_R10_movesOut_full_fibertool_nuc_filtered.bed \
    -o /scratch/gabai/yeast_methyl/ \
    -p 251012_nuc_count_n_cluster_6_ys18_rep1_conv_euc \
    -t 32 \
    -nc 6 \
    --annot_plus_one \
    --sample_names WT_rep1 \
    --dist conv \
    --dist2 euclidean \
    -gn /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/processed/250811_aresv13_gene_gene_correlation.bed \
    -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa

python3 /private/groups/brookslab/gabai/tools/epiflair/src/count_nuc.py \
    -gt /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
    -nuc /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250331_cutoff125_ys18_150UNuc_Rep2_R10_movesOut_full_fibertool_nuc_filtered.bed \
    -o /scratch/gabai/yeast_methyl/ \
    -p 251012_nuc_count_n_cluster_6_ys18_rep2_conv_euc \
    -t 16 \
    -nc 6 \
    --annot_plus_one \
    --sample_names WT_rep2 \
    --dist conv \
    --dist2 euclidean \
    -gn /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/processed/250811_aresv13_gene_gene_correlation.bed \
    -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa

python3 /private/groups/brookslab/gabai/tools/epiflair/src/count_nuc.py \
    -gt /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
    -nuc /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250331_cutoff125_ym209_150UNUC_Rep1_R10_movesout_full_fibertool_nuc_filtered.bed \
    -o /scratch/gabai/yeast_methyl/ \
    -p 251012_nuc_count_n_cluster_6_ym209_rep1_conv_euc \
    -t 16 \
    -nc 6 \
    --annot_plus_one \
    --cmap_i 2 \
    --sample_names MUT_rep1 \
    --dist conv \
    --dist2 euclidean \
    -gn /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/processed/250811_aresv13_gene_gene_correlation.bed \
    -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa


python3 /private/groups/brookslab/gabai/tools/epiflair/src/count_nuc.py \
    -gt /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed \
    -nuc /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250331_cutoff125_ym209_150UNUC_Rep2_R10_movesout_full_fibertool_nuc_filtered.bed \
    -o /scratch/gabai/yeast_methyl/ \
    -p 251012_nuc_count_n_cluster_6_ym209_rep2_conv_euc \
    -t 16 \
    -nc 6 \
    --annot_plus_one \
    --cmap_i 2 \
    --sample_names MUT_rep2 \
    --dist conv \
    --dist2 euclidean \
    -gn /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/processed/250811_aresv13_gene_gene_correlation.bed \
    -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa

