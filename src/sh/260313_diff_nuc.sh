inpath="/scratch/gabai/yeast_methyl/"
gt="/private/home/gabai/projects/saccer_lr_multiome_manuscript/data/2_final_iso_tb.tsv"
prefix="260312_nuc_count_n_cluster_6_"
suffix="_conv_euc_promoter_restricted_nuc_cluster_count.tsv"

python3 /private/groups/brookslab/gabai/tools/epiflair/src/diff_nuc.py \
    --gt ${gt} \
    --counts ${inpath}${prefix}ys18_rep1${suffix} ${inpath}${prefix}ys18_rep2${suffix} ${inpath}${prefix}ym209_rep1${suffix} ${inpath}${prefix}ym209_rep2${suffix} \
    --condition2_samples MUT_rep1 MUT_rep2 \
    --condition1_samples WT_rep1 WT_rep2 \
    --condition2_prefix MUT \
    --condition1_prefix WT \
    --outdir ${inpath} \
    --prefix 260313_diff_nuc_promoter_restricted