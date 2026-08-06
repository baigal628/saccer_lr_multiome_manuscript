nuc_path="/private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/"
ys18_rep1_nuc_bed="${nuc_path}250331_cutoff125_ys18_150UNuc_Rep1_R10_movesOut_full_fibertool_nuc_filtered.bed"
ys18_rep2_nuc_bed="${nuc_path}250331_cutoff125_ys18_150UNuc_Rep2_R10_movesOut_full_fibertool_nuc_filtered.bed"
ym209_rep1_nuc_bed="${nuc_path}250331_cutoff125_ym209_150UNUC_Rep1_R10_movesout_full_fibertool_nuc_filtered.bed"
ym209_rep2_nuc_bed="${nuc_path}250331_cutoff125_ym209_150UNUC_Rep2_R10_movesout_full_fibertool_nuc_filtered.bed"

gtf="/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed"

outpath="/private/groups/brookslab/gabai/projects/yeastMeth/figures/"
gene_gtf="/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/260311_genes_of_interest_ares_v13.bed"


geneids=("REC114" "SMM1" "LSR1")

rm "${gene_gtf}"
touch "${gene_gtf}"
for geneid in "${geneids[@]}"; do
    echo ${geneid}
    grep ${geneid} "${gtf}" >> "${gene_gtf}"
done

bedtools sort -i "${gene_gtf}" > "${gene_gtf}.sorted.bed"


python3 /private/groups/brookslab/gabai/tools/epiflair/src/count_nuc.py \
    -gt "${gene_gtf}.sorted.bed" \
    -nuc "${ys18_rep1_nuc_bed}" \
    -o ${outpath} \
    -p "Supp_Figure2_ys18_rep1" \
    -t 4 \
    --plot_nuc \
    -nc 6 \
    --cmap_i 0 \
    --plot_by_cluster \
    --sample_names WT_rep1 \
    -gn /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/processed/250811_aresv13_gene_gene_correlation.bed \
    -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa


# python3 /private/groups/brookslab/gabai/tools/epiflair/src/count_nuc.py \
#     -gt "${gene_gtf}.sorted.bed" \
#     -nuc "${ys18_rep2_nuc_bed}" \
#     -o ${outpath} \
#     -p "Supp_Figure2_ys18_rep2" \
#     -t 4 \
#     --plot_nuc \
#     -nc 6 \
#     --cmap_i 0 \
#     --plot_by_cluster \
#     --sample_names WT_rep2 \
#     -gn /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/processed/250811_aresv13_gene_gene_correlation.bed \
#     -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa


python3 /private/groups/brookslab/gabai/tools/epiflair/src/count_nuc.py \
    -gt "${gene_gtf}.sorted.bed" \
    -nuc "${ym209_rep1_nuc_bed}" \
    -o ${outpath} \
    -p "Supp_Figure2_ym209_rep1" \
    -t 4 \
    --plot_nuc \
    -nc 6 \
    --cmap_i 2 \
    --plot_by_cluster \
    --sample_names MUT_rep1 \
    -gn /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/processed/250811_aresv13_gene_gene_correlation.bed \
    -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa



# python3 /private/groups/brookslab/gabai/tools/epiflair/src/count_nuc.py \
#     -gt "${gene_gtf}.sorted.bed" \
#     -nuc "${ym209_rep2_nuc_bed}" \
#     -o ${outpath} \
#     -p "Supp_Figure2_ym209_rep2" \
#     -t 4 \
#     --plot_nuc \
#     -nc 6 \
#     --cmap_i 2 \
#     --plot_by_cluster \
#     --sample_names MUT_rep2 \
#     -gn /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/processed/250811_aresv13_gene_gene_correlation.bed \
#     -g /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa