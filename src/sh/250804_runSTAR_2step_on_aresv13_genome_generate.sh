#!/bin/bash
#SBATCH --job-name=genomeGenerate
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --nodes=1
#SBATCH --time=120
#SBATCH --mem=50G
#SBATCH --partition=medium
#SBATCH --error=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/totalrna/star_2step/log/lsf_genomeGenerate.err
#SBATCH --output=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/totalrna/star_2step/log/lsf_genomeGenerate.out
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=gabai@ucsc.edu

/private/groups/brookslab/bin/STAR-2.7.11b/bin/Linux_x86_64_static/STAR \
    --runThreadN 32 \
    --runMode genomeGenerate \
    --genomeDir /private/groups/brookslab/gabai/tools/ref/yst/star_aresv13/ \
    --genomeFastaFiles /private/groups/brookslab/gabai/projects/Add-seq/data/ref/sacCer3.fa \
    --sjdbGTFfile /private/groups/brookslab/gabai/tools/ref/yst/sacCer3_ares_v13.gtf \
    --genomeSAindexNbases 10 \
    --sjdbOverhang 149