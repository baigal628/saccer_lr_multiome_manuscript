## Do not need to edit
plus_one_bed="/private/groups/brookslab/gabai/projects/yeastMeth/data/dna/annot_ndr/251111_plus_one_denovo_ys18_rep1_plus_one_median.bed"
outdir="/private/groups/brookslab/gabai/projects/yeastMeth/data/dna/agg/"
inpath="/private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/"
ys18_rep1_bed="${inpath}250304_ys18_150UNuc_Rep1_R10_movesOut_sub100k_fibertool_nuc_filtered.bed"
ys18_rep2_bed="${inpath}250304_ys18_150UNuc_Rep2_R10_movesOut_sub100k_fibertool_nuc_filtered.bed"
ym209_rep1_bed="${inpath}250304_ym209_150UNUC_Rep1_R10_movesout_sub100k_fibertool_nuc_filtered.bed"
ym209_rep2_bed="${inpath}250304_ym209_150UNUC_Rep2_R10_movesout_sub100k_fibertool_nuc_filtered.bed"

# define genes to plor
genelist="/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/processed/251107_short_read_down_genes.tsv"
prefix="251111_total_down_reg_genes_denovo_plus_one"

### filter bed by genelist
out_bed="${outdir}${prefix}_ys18_rep1_plus_one.bed"

python3 /private/groups/brookslab/gabai/tools/epiflair/src/filter_plus_one_by_gene.py \
    --bed $plus_one_bed \
    --genelist $genelist \
    --outbed $out_bed

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep1_bed \
    --bed $out_bed \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep2_bed \
    --bed $out_bed \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep2

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep1_bed \
    --bed $out_bed \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep2_bed \
    --bed $out_bed \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep2