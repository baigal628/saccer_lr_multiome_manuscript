/private/groups/brookslab/gabai/tools/fibertools-rs/target/release/ft add-nucleosomes \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/raw/full_data/230824_ys18_150UNuc_Rep1_R10_movesOut.pass.sorted.bam \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ys18_150UNuc_Rep1_R10_movesOut_full.pass.sorted_fibertool_nuc.bam

/private/groups/brookslab/gabai/tools/fibertools-rs/target/release/ft add-nucleosomes \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/raw/full_data/230928_ys18_150UNuc_Rep2_R10_movesOut.pass.sorted.bam \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ys18_150UNuc_Rep2_R10_movesOut_full.pass.sorted_fibertool_nuc.bam

/private/groups/brookslab/gabai/tools/fibertools-rs/target/release/ft add-nucleosomes \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/raw/full_data/230908_ym209_150UNUC_Rep1_R10_movesout.pass.sorted.bam \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ym209_150UNUC_Rep1_R10_movesout_full.pass.sorted_fibertool_nuc.bam

/private/groups/brookslab/gabai/tools/fibertools-rs/target/release/ft add-nucleosomes \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/raw/full_data/231006_ym209_150UNuc_Rep2_R10.pass.sorted.bam \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ym209_150UNuc_Rep2_R10_movesout_full.pass.sorted_fibertool_nuc.bam

# convert to bed
/private/groups/brookslab/gabai/tools/fibertools-rs/target/release/ft extract /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ys18_150UNuc_Rep1_R10_movesOut_full.pass.sorted_fibertool_nuc.bam \
    -n /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ys18_150UNuc_Rep1_R10_movesOut_full_fibertool_nuc.bed

/private/groups/brookslab/gabai/tools/fibertools-rs/target/release/ft extract /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ys18_150UNuc_Rep2_R10_movesOut_full.pass.sorted_fibertool_nuc.bam \
    -n /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ys18_150UNuc_Rep2_R10_movesOut_full_fibertool_nuc.bed

/private/groups/brookslab/gabai/tools/fibertools-rs/target/release/ft extract /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ym209_150UNUC_Rep1_R10_movesout_full.pass.sorted_fibertool_nuc.bam \
    -n /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ym209_150UNUC_Rep1_R10_movesout_full_fibertool_nuc.bed

/private/groups/brookslab/gabai/tools/fibertools-rs/target/release/ft extract /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ym209_150UNuc_Rep2_R10_movesout_full.pass.sorted_fibertool_nuc.bam \
    -n /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/250312_cutoff125_ym209_150UNUC_Rep2_R10_movesout_full_fibertool_nuc.bed


# merge bed
for file in 250312_cutoff125_*_full_fibertool_nuc.bed; do
    name=$(basename "$file" .bed | cut -d'_' -f3-5)
    awk -v name="$name" '{print $0"\t"name}' "$file"
done > 250312_cutoff125_full_fibertool_nuc_merged.bed

sort -k1,1 -k2,2n -k3,3n 250312_cutoff125_full_fibertool_nuc_merged.bed > 250312_cutoff125_full_fibertool_nuc_merged.sorted.bed

# filter rDNA and chrM DNA from the bed files
bedtools subtract -A -a 250312_cutoff125_ys18_150UNuc_Rep1_R10_movesOut_full_fibertool_nuc.bed -b /private/groups/brookslab/gabai/tools/ref/yst/sacCer3_RDN.bed | grep -v chrM > 250331_cutoff125_ys18_150UNuc_Rep1_R10_movesOut_full_fibertool_nuc_filtered.bed
bedtools subtract -A -a 250312_cutoff125_ys18_150UNuc_Rep2_R10_movesOut_full_fibertool_nuc.bed -b /private/groups/brookslab/gabai/tools/ref/yst/sacCer3_RDN.bed | grep -v chrM > 250331_cutoff125_ys18_150UNuc_Rep2_R10_movesOut_full_fibertool_nuc_filtered.bed
bedtools subtract -A -a 250312_cutoff125_ym209_150UNUC_Rep1_R10_movesout_full_fibertool_nuc.bed -b /private/groups/brookslab/gabai/tools/ref/yst/sacCer3_RDN.bed | grep -v chrM > 250331_cutoff125_ym209_150UNUC_Rep1_R10_movesout_full_fibertool_nuc_filtered.bed
bedtools subtract -A -a 250312_cutoff125_ym209_150UNUC_Rep2_R10_movesout_full_fibertool_nuc.bed -b /private/groups/brookslab/gabai/tools/ref/yst/sacCer3_RDN.bed | grep -v chrM > 250331_cutoff125_ym209_150UNUC_Rep2_R10_movesout_full_fibertool_nuc_filtered.bed

