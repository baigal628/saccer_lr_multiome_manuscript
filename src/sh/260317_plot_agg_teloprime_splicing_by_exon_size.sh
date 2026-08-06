outdir="/private/groups/brookslab/gabai/projects/yeastMeth/data/dna/agg/"
inpath="/private/groups/brookslab/gabai/projects/yeastMeth/data/dna/nuc_calling/"
ys18_rep1_bed="${inpath}250304_ys18_150UNuc_Rep1_R10_movesOut_sub100k_fibertool_nuc_filtered.bed"
ys18_rep2_bed="${inpath}250304_ys18_150UNuc_Rep2_R10_movesOut_sub100k_fibertool_nuc_filtered.bed"
ym209_rep1_bed="${inpath}250304_ym209_150UNUC_Rep1_R10_movesout_sub100k_fibertool_nuc_filtered.bed"
ym209_rep2_bed="${inpath}250304_ym209_150UNUC_Rep2_R10_movesout_sub100k_fibertool_nuc_filtered.bed"


ss5_bed="/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_ss5_less_than_300.bed"
ss3_bed="/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_ss3_less_than_300.bed"
out_bed_ss5=$ss5_bed
out_bed_ss3=$ss3_bed

# plot ss5
prefix="260317_ares_v13_all_splicing_ss5_less_than_300"

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep1_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep2_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep2

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep1_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep2_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep2


# plot ss3
prefix="260317_ares_v13_all_splicing_ss3_less_than_300"

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep1_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep2_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep2

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep1_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep2_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep2


########################################################
# plot ss5 larger than 600
########################################################
ss5_bed="/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_ss5_larger_than_600.bed"
ss3_bed="/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_ss3_larger_than_600.bed"
out_bed_ss5=$ss5_bed
out_bed_ss3=$ss3_bed

prefix="260317_ares_v13_all_splicing_ss5_larger_than_600"

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep1_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep2_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep2

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep1_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep2_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep2 

prefix="260317_ares_v13_all_splicing_ss3_larger_than_600"

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep1_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep2_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep2
    

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep1_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep1
    

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep2_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep2

ss5_bed="/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_ss5_between_300_600.bed"
ss3_bed="/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_ss3_between_300_600.bed"
out_bed_ss5=$ss5_bed
out_bed_ss3=$ss3_bed

prefix="260317_ares_v13_all_splicing_ss5_between_300_600"

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep1_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep2_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep2

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep1_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep2_bed \
    --bed $out_bed_ss5 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep2

prefix="260317_ares_v13_all_splicing_ss3_between_300_600"

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep1_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ys18_rep2_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label WT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ys18_rep2

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep1_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep1 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep1

### plot aggregate
python3 /private/groups/brookslab/gabai/tools/epiflair/src/plot.py \
    --plot aggregate \
    --nuc_bed $ym209_rep2_bed \
    --bed $out_bed_ss3 \
    --ref /private/groups/brookslab/gabai/tools/ref/yst/sacCer3.fa \
    --label MUT_rep2 \
    --outpath $outdir \
    --window 2000 \
    --prefix ${prefix}_ym209_rep2