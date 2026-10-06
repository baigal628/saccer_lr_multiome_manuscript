ym209_rep1="/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/260302_ym209_rep1_teloprime_iso_annotated_by_tss_iso_annotated.bam"
ym209_rep2="/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/260302_ym209_rep2_teloprime_iso_annotated_by_tss_iso_annotated.bam"
outpath="/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/iso_annot/downsample/"
samtools view -@ 4 -s 0.6 -b ${ym209_rep1} > ${outpath}ym209_rep1_0.6.bam
samtools view -@ 4 -s 0.4 -b ${ym209_rep2} > ${outpath}ym209_rep2_0.4.bam

samtools sort -@ 16 ${outpath}ym209_rep1_0.6.bam -o ${outpath}ym209_rep1_0.6.sorted.bam
samtools sort -@ 16 ${outpath}ym209_rep2_0.4.bam -o ${outpath}ym209_rep2_0.4.sorted.bam
samtools index ${outpath}ym209_rep1_0.6.sorted.bam
samtools index ${outpath}ym209_rep2_0.4.sorted.bam

for i in *.sorted.bam; do samtools flagstat "$i" > "${i%.bam}.flagstat"; done