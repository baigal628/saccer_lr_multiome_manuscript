~/tools/dorado-0.7.3-linux-x64/bin/dorado demux -v \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/ \
    --emit-fastq \
    --kit-name SQK-NBD114-24 \
    --barcode-both-ends \
    /private/groups/brookslab/data.rep/yeast_TeloPrime/241107_TeloPrime.fastq

~/tools/dorado-0.7.3-linux-x64/bin/dorado demux -v \
    -o /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/round2/ \
    --emit-fastq \
    --kit-name SQK-NBD114-24 \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/unclassified.fastq


cat /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/SQK-NBD114-24_barcode01.fastq /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/round2/SQK-NBD114-24_barcode01.fastq > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode01.fastq

cat /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/SQK-NBD114-24_barcode02.fastq /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/round2/SQK-NBD114-24_barcode02.fastq > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode02.fastq

cat /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/SQK-NBD114-24_barcode03.fastq /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/round2/SQK-NBD114-24_barcode03.fastq > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode03.fastq

cat /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/SQK-NBD114-24_barcode04.fastq /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/round2/SQK-NBD114-24_barcode04.fastq > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode04.fastq

cat /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/SQK-NBD114-24_barcode05.fastq /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/round2/SQK-NBD114-24_barcode05.fastq > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode05.fastq

cat /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/SQK-NBD114-24_barcode06.fastq /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/round2/SQK-NBD114-24_barcode06.fastq > /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode06.fastq

pychopper \
    -r /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_teloprime_barcode01_report.pdf \
    -t 16 \
    -Q 5 \
    -z 20 \
    -m edlib \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer.fa \
    -c /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer_config \
    -u /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode01_unclassified.fastq \
    -K /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode01_qc_fail.fastq \
    -w /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode01_rescued.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode01.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode01_trimmed.fastq

pychopper \
    -r /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_teloprime_barcode02_report.pdf \
    -t 16 \
    -Q 5 \
    -z 20 \
    -m edlib \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer.fa \
    -c /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer_config \
    -u /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode02_unclassified.fastq \
    -K /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode02_qc_fail.fastq \
    -w /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode02_rescued.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode02.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode02_trimmed.fastq


pychopper \
    -r /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_teloprime_barcode03_report.pdf \
    -t 16 \
    -Q 5 \
    -z 20 \
    -m edlib \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer.fa \
    -c /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer_config \
    -u /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode03_unclassified.fastq \
    -K /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode03_qc_fail.fastq \
    -w /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode03_rescued.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode03.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode03_trimmed.fastq

pychopper \
    -r /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_teloprime_barcode04_report.pdf \
    -t 16 \
    -Q 5 \
    -z 20 \
    -m edlib \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer.fa \
    -c /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer_config \
    -u /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode04_unclassified.fastq \
    -K /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode04_qc_fail.fastq \
    -w /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode04_rescued.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode04.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode04_trimmed.fastq

pychopper \
    -r /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_teloprime_barcode05_report.pdf \
    -t 16 \
    -Q 5 \
    -z 20 \
    -m edlib \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer.fa \
    -c /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer_config \
    -u /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode05_unclassified.fastq \
    -K /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode05_qc_fail.fastq \
    -w /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode05_rescued.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode05.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode05_trimmed.fastq

pychopper \
    -r /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_teloprime_barcode06_report.pdf \
    -t 16 \
    -Q 5 \
    -z 20 \
    -m edlib \
    -b /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer.fa \
    -c /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/primer_config \
    -u /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode06_unclassified.fastq \
    -K /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode06_qc_fail.fastq \
    -w /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode06_rescued.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/demultiplexed/merge_round1_2/SQK-NBD114-24_merge_2rounds_barcode06.fastq \
    /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/trimmed/241120_barcode06_trimmed.fastq