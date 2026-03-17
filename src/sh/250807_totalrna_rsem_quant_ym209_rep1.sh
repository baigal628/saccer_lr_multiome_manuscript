#!/bin/bash
#SBATCH --job-name=yeast_totalrna_rsem_ym209_rep1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --nodes=1
#SBATCH --time=120
#SBATCH --mem=100G
#SBATCH --partition=medium
#SBATCH --error=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/totalrna/rsem/log/lsf_ym209_rep1.err
#SBATCH --output=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/totalrna/rsem/log/lsf_ym209_rep1.out
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=gabai@ucsc.edu

/private/groups/brookslab/bin/RSEM-1.3.0/rsem-calculate-expression --no-bam-output \
    --seed 12345 -p 16 \
    --strandedness reverse \
    --alignments \
    --paired-end /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/totalrna/star_2step/ym209_rep1Aligned.toTranscriptome.out.pass.sorted.pass.rname.sorted.bam /private/groups/brookslab/gabai/tools/ref/yst/rsem_ares_v13 /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/totalrna/rsem/ym209_rep1