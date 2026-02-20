#!/bin/bash
#SBATCH --job-name=yeast_totalRNA_STAR_step1_ym209_rep2
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --nodes=1
#SBATCH --time=120
#SBATCH --mem=100G
#SBATCH --partition=medium
#SBATCH --error=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/totalrna/star_2step/log/lsf_ym209_rep2.err
#SBATCH --output=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/totalrna/star_2step/log/lsf_ym209_rep2.out
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=gabai@ucsc.edu

/private/groups/brookslab/bin/STAR-2.7.11b/bin/Linux_x86_64_static/STAR \
    --runThreadN 16 \
    --genomeDir /private/groups/brookslab/gabai/tools/ref/yst/star_aresv13/ \
    --readFilesIn /private/groups/brookslab/data.rep/yeast_shortread_rnaseq/Dhillon-5_R1_001.fastq.gz /private/groups/brookslab/data.rep/yeast_shortread_rnaseq/Dhillon-5_R2_001.fastq.gz \
    --twopassMode Basic --readFilesCommand zcat \
    --alignIntronMin 40  --alignIntronMax 2000 \
    --alignMatesGapMax 4000 \
    --alignSJDBoverhangMin 1 \
    --sjdbOverhang 149 --outSJfilterIntronMaxVsReadN  2000 2000 2000 \
    --outSAMtype BAM SortedByCoordinate \
    --quantMode TranscriptomeSAM \
    --outFileNamePrefix /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/totalrna/star_2step/ym209_rep2 \
    --limitBAMsortRAM 1565589641