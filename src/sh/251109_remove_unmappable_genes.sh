awk '($5 ==0)' /private/groups/brookslab/gabai/tools/ref/yst/new_map/800.bed | \
    cut -f1-4 | \
    LC_COLLATE=C sort -k1,1 -k2,2n \
    > /private/groups/brookslab/gabai/tools/ref/yst/sacCer3_unmappable_regions.bed

bedtools intersect \
    -a /private/groups/brookslab/gabai/tools/ref/yst/sacCer3_ares_v13_sorted.bed \
    -b /private/groups/brookslab/gabai/tools/ref/yst/sacCer3_unmappable_regions.bed -v | \
    LC_COLLATE=C sort -k1,1 -k2,2n \
    > /private/groups/brookslab/gabai/tools/ref/yst/sacCer3_ares_v13_mappable_genes.bed