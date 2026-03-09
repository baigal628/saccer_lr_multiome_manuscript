# ys18 rep1
minimap2 \
    -ax splice:hq \
    -t 16 --secondary=no \
    -G 3k \
    -uf \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/trimmed/250722_RiboPool_LSK114_ys18_rep1_nRNA_trimmed.fastq \
    | samtools view -hb -F SECONDARY,SUPPLEMENTARY - | samtools sort  -@ 16 - \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250908_RiboPool_LSK114_ys18_rep1_nRNA_trimmed.sorted.bam

# ys18 rep2
minimap2 \
    -ax splice:hq \
    -t 16 --secondary=no \
    -G 3k \
    -uf \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/trimmed/250722_RiboPool_LSK114_ys18_rep2_nRNA_trimmed.fastq \
    | samtools view -hb -F SECONDARY,SUPPLEMENTARY - | samtools sort  -@ 16 - \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250908_RiboPool_LSK114_ys18_rep2_nRNA_trimmed.sorted.bam

# ym209 rep1
minimap2 \
    -ax splice:hq \
    -t 16 --secondary=no \
    -G 3k \
    -uf \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/trimmed/250722_RiboPool_LSK114_ym209_rep1_nRNA_trimmed.fastq \
    | samtools view -hb -F SECONDARY,SUPPLEMENTARY - | samtools sort  -@ 16 - \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250908_RiboPool_LSK114_ym209_rep1_nRNA_trimmed.sorted.bam

# ym209 rep2
minimap2 \
    -ax splice:hq \
    -t 16 --secondary=no \
    -G 3k \
    -uf \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/trimmed/250722_RiboPool_LSK114_ym209_rep2_nRNA_trimmed.fastq \
    | samtools view -hb -F SECONDARY,SUPPLEMENTARY - | samtools sort  -@ 16 - \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250908_RiboPool_LSK114_ym209_rep2_nRNA_trimmed.sorted.bam

for i in /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/*.sorted.bam; do samtools index $i; done



