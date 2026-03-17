python3 ~/tools/epiflair/src/split_gene.py \
    -b /private/groups/brookslab/gabai/projects/tools/ref/yst/sacCer3_ares_v13_sorted.bed \
    -o /private/groups/brookslab/gabai/projects/tools/ref/yst/ \
    -p 251201_sacCer3_ares_v13 \
    -n 8

refbed=/private/groups/brookslab/gabai/projects/tools/ref/yst/251201_sacCer3_ares_v13_split_8.sorted.bed
sort -k1,1 -k2,2n /private/groups/brookslab/gabai/projects/tools/ref/yst/251201_sacCer3_ares_v13_split_8.bed > $refbed

bedtools coverage \
    -a $refbed \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_final_5prime_only.pass.sorted.bam \
    -s \
    -sorted \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/pausing/251201_ys18_rep1_coverage_per_gene.bed

bedtools coverage \
    -a $refbed \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_final_5prime_only.pass.sorted.bam \
    -s \
    -sorted \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/pausing/251201_ys18_rep2_coverage_per_gene.bed

bedtools coverage \
    -a $refbed \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_final_5prime_only.pass.sorted.bam \
    -s \
    -sorted \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/pausing/251201_ym209_rep1_coverage_per_gene.bed

bedtools coverage \
    -a $refbed \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/251201_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_final_5prime_only.pass.sorted.bam \
    -s \
    -sorted \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/pausing/251201_ym209_rep2_coverage_per_gene.bed


#
cov_ys18_rep1=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/pausing/251201_ys18_rep1_coverage_per_gene.bed
cov_ys18_rep2=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/pausing/251201_ys18_rep2_coverage_per_gene.bed
cov_ym209_rep1=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/pausing/251201_ym209_rep1_coverage_per_gene.bed
cov_ym209_rep2=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/pausing/251201_ym209_rep2_coverage_per_gene.bed

python3 /private/groups/brookslab/gabai/projects/yeastMeth/scripts/py/251201_make_gene_quantile_cov_table.py \
    -c $cov_ys18_rep1 $cov_ys18_rep2 $cov_ym209_rep1 $cov_ym209_rep2 \
    -s WT_rep1 WT_rep2 MUT_rep1 MUT_rep2 \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/pausing/ \
    -p 251201_gene_quantile_cov_table
