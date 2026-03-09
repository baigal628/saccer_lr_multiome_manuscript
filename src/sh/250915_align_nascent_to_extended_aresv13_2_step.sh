############################################################
# Filter nascent RNA reads and keep reads with 5' cap and no 3' polyA tail
# Step1: filter nascent RNA reads to keep only those with both 5' cap and 3' polyA tail
# Step2: realign un-capped reads to transcriptome for intron containing genes (extended) only
# Step3: rescue un-capped (genomic alignment) reads that align to intron containing genes only and has capped ends
# step5: align rescued reads back to genome and merge with original pass reads
#############################################################


python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250908_RiboPool_LSK114_ys18_rep1_nRNA_trimmed.sorted.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed.pass.sorted.bam \
    --nocap /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed.pass.sorted.nocap.bam

python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250908_RiboPool_LSK114_ys18_rep2_nRNA_trimmed.sorted.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmed.pass.sorted.bam \
    --nocap /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmed.pass.sorted.nocap.bam

python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250908_RiboPool_LSK114_ym209_rep1_nRNA_trimmed.sorted.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ym209_rep1_nRNA_trimmed.pass.sorted.bam \
    --nocap /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ym209_rep1_nRNA_trimmed.pass.sorted.nocap.bam

python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250908_RiboPool_LSK114_ym209_rep2_nRNA_trimmed.sorted.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ym209_rep2_nRNA_trimmed.pass.sorted.bam \
    --nocap /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_ym209_rep2_nRNA_trimmed.pass.sorted.nocap.bam


# realign un-capped reads to transcriptome for intron containing genes (extended) only

for i in *_trimmed.pass.sorted.nocap.bam; do
  samtools view -b -q 10 "$i" \
  | samtools fastq - \
  | minimap2 \
      -ax map-ont \
      -t 20 --secondary=no \
      --for-only \
      /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_extended_genes_with_introns_all_flairome.fa - \
  | samtools view -hb - \
  | samtools sort -@ 20 -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/"${i/.pass.sorted.nocap.bam/intron_containing_for_only.pass.sorted.nocap.bam}"
done

# rescue un-capped reads that align to intron containing genes only and has capped ends
python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmedintron_containing_for_only.pass.sorted.nocap.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250915_RiboPool_LSK114_ys18_rep1_nRNA_trimmed_intron_containing_for_only.pass.sorted.recapped.bam \
    --tx_alignment

python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmedintron_containing_for_only.pass.sorted.nocap.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250915_RiboPool_LSK114_ys18_rep2_nRNA_trimmed_intron_containing_for_only.pass.sorted.recapped.bam \
    --tx_alignment

python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250915_RiboPool_LSK114_ym209_rep1_nRNA_trimmedintron_containing_for_only.pass.sorted.nocap.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250915_RiboPool_LSK114_ym209_rep1_nRNA_trimmed_intron_containing_for_only.pass.sorted.recapped.bam \
    --tx_alignment

python3 ~/tools/epiflair/src/filter_nascent.py \
    -i /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250915_RiboPool_LSK114_ym209_rep2_nRNA_trimmedintron_containing_for_only.pass.sorted.nocap.bam \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250915_RiboPool_LSK114_ym209_rep2_nRNA_trimmed_intron_containing_for_only.pass.sorted.recapped.bam \
    --tx_alignment

# align rescue reads from transcriptomic alignment back to genome and merge with original pass reads
for i in ys18_rep1 ys18_rep2 ym209_rep1 ym209_rep2; do
    rescued_bam=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/${i}_rescued.bam
    final_bam=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_${i}_nRNA_trimmed_final.pass.sorted.bam
    original_bam=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250915_RiboPool_LSK114_${i}_nRNA_trimmed.pass.sorted.bam
    tx_bam=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment/250915_RiboPool_LSK114_${i}_nRNA_trimmed_intron_containing_for_only.pass.sorted.recapped.bam

    # re-align "rescued" reads to genome
    samtools fastq "$tx_bam" \
    | minimap2 -ax splice:hq -t 20 --secondary=no -uf -G 3k /private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3.fa - \
    | samtools view -hb -F 2304 -o "$rescued_bam"

    # merge rescued + original
    samtools merge -@ 20 tmp.merged.bam "$rescued_bam" "$original_bam"

    # sort + index
    samtools sort -@ 20 -o "$final_bam" tmp.merged.bam
    samtools index "$final_bam"

    # clean up
    rm tmp.merged.bam "$rescued_bam"
done

# convert final bams to fastq
for i in *_trimmed_final.pass.sorted.bam; do
  samtools view -b -q 10 "$i" \
    | samtools fastq - \
    > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/filtered_fastq/${i/.sorted.bam/.fastq}
done


############################################################
# Align filtered reads to extended aresv13 transcriptome
# step1: align to transcriptome with --for-only
# step2: take unaligned reads and realign to transcriptome without --for-only
# step3: merge the two bam files
#############################################################

ref=/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_extended_flairome.fa
fqdir=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/filtered_fastq
txdir=/private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/tx_alignment

for i in ys18_rep1 ys18_rep2 ym209_rep1 ym209_rep2; do
    fq=$fqdir/250915_RiboPool_LSK114_${i}_nRNA_trimmed_final.pass.fastq

    # Step 1: align with --for-only
    for_only_bam=$txdir/250919_RiboPool_LSK114_${i}_nRNA_trimmed_for_only.pass.sorted.bam
    minimap2 -ax map-ont -t 20 --secondary=no --for-only "$ref" "$fq" \
      | samtools sort -@ 20 -o "$for_only_bam"

    # Step 2: realign unaligned reads (pipe directly, no intermediate fastq)
    realigned_bam=$txdir/250919_RiboPool_LSK114_${i}_nRNA_trimmed_realigned.pass.sorted.bam
    samtools fastq -f 4 "$for_only_bam" \
      | minimap2 -ax map-ont -t 20 --secondary=no "$ref" - \
      | samtools sort -@ 20 -o "$realigned_bam"

    # Step 3: merge
    merged_bam=$txdir/250919_RiboPool_LSK114_${i}_nRNA_trimmed_merged.pass.sorted.bam
    samtools merge -@ 20 "$merged_bam" "$for_only_bam" "$realigned_bam"
    samtools index "$merged_bam"

    # Cleanup intermediates
    rm "$for_only_bam" "$realigned_bam"
done

