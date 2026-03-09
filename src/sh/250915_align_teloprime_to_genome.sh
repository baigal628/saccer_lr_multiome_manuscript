# ys18 rep1
minimap2 \
    -ax splice:hq \
    -t 16 --secondary=no \
    -G 3k \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode01_trimmed.fastq \
    | samtools view -hb -F SECONDARY,SUPPLEMENTARY - | samtools sort  -@ 16 - \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ys18_rep1_teloprime_trimmed.sorted.bam

# ys18 rep2
minimap2 \
    -ax splice:hq \
    -t 16 --secondary=no \
    -G 3k \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode02_trimmed.fastq \
    | samtools view -hb -F SECONDARY,SUPPLEMENTARY - | samtools sort  -@ 16 - \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ys18_rep2_teloprime_trimmed.sorted.bam

# ys18 rep3
minimap2 \
    -ax splice:hq \
    -t 16 --secondary=no \
    -G 3k \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode03_trimmed.fastq \
    | samtools view -hb -F SECONDARY,SUPPLEMENTARY - | samtools sort  -@ 16 - \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ys18_rep3_teloprime_trimmed.sorted.bam

# ym209 rep1
minimap2 \
    -ax splice:hq \
    -t 16 --secondary=no \
    -G 3k \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode04_trimmed.fastq \
| samtools view -hb -F SECONDARY,SUPPLEMENTARY - | samtools sort  -@ 16 - \
> /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ym209_rep1_teloprime_trimmed.sorted.bam

# ym209 rep2
minimap2 \
    -ax splice:hq \
    -t 16 --secondary=no \
    -G 3k \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode05_trimmed.fastq \
| samtools view -hb -F SECONDARY,SUPPLEMENTARY - | samtools sort  -@ 16 - \
> /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ym209_rep2_teloprime_trimmed.sorted.bam

# ym209 rep3
minimap2 \
    -ax splice:hq \
    -t 16 --secondary=no \
    -G 3k \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode06_trimmed.fastq \
| samtools view -hb -F SECONDARY,SUPPLEMENTARY - | samtools sort  -@ 16 - \
> /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915_ym209_rep3_teloprime_trimmed.sorted.bam

for i in /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/*.sorted.bam; do samtools index $i; done
