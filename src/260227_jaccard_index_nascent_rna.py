import numpy as np
import pysam
import os
import argparse

def load_tss(tss_beds):
    '''
    Load TSS peaks from a list of bed files.
    tss_beds: list of bed files
    '''
    # read cage
    reference_tss = set()
    for b in tss_beds:
        print(f'loading tss file: {b}')
        with open(b, 'r') as infile:
            for line in infile:
                line = line.strip().split('\t')
                chrom, start, end, strand  = line[0], int(line[1]), int(line[2]), line[5]
                for pos in range(start, end+1):
                    reference_tss.add(f"{chrom}:{pos}:{strand}")
    return reference_tss, len(reference_tss)

def load_reads_to_filter(reads_to_filter):
    '''
    Load reads to filter from a list of files.
    reads_to_filter: list of files
    '''
    reads_to_filter = set()
    for f in reads_to_filter:
        with open(f, 'r') as infile:
            for line in infile:
                reads_to_filter.add(line.strip())
    return reads_to_filter

def jaccard_nascent_rna(bam_file, reference_tss, reads_to_filter=None, min_mapq=20):

    print(f'processing input file: {bam_file}')

    bamfile = pysam.AlignmentFile(bam_file, "rb")

    observed_tss = set()

    # Collect observed 5' ends
    c = 0
    for read in bamfile.fetch(until_eof=True):

        c += 1
        if c % 100000 == 0:
            print(f'processed {c} reads...')

        if read.is_unmapped or read.is_secondary or read.is_supplementary or read.mapping_quality < min_mapq:
            continue 

        if reads_to_filter and read.query_name in reads_to_filter:
            continue

        chrom = read.reference_name
        if chrom is None:
            continue

        strand = '+' if not read.is_reverse else '-'
        cap_5 = read.reference_start if not read.is_reverse else read.reference_end

        observed_tss.add(f"{chrom}:{cap_5}:{strand}")

    bamfile.close()

    intersection = len(observed_tss & reference_tss)
    union = len(observed_tss | reference_tss)

    jaccard = intersection / union if union > 0 else 0

    print(f'observed unique TSS: {len(observed_tss)}')
    print(f'intersection: {intersection}')
    print(f'union: {union}')
    print(f'Jaccard index: {jaccard:.4f}')

    return jaccard, len(observed_tss), intersection, union

def arg_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument('--bam_file', type=str, required=True)
    parser.add_argument('--tss_beds', type=str, required=True, help='Comma-separated list of BED files (e.g. a.bed,b.bed,c.bed)')
    parser.add_argument('--reads_to_exclude', type=str, default='', required=False)
    parser.add_argument('--outdir', type=str, default='./', required=False)
    parser.add_argument('--prefix', type=str, default='precision_recall_nascent_rna', required=False)
    return parser.parse_args()

if __name__ == '__main__':
    args = arg_parser()
    tss_beds_list = [f.strip() for f in args.tss_beds.split(',')]
    reference_tss, total_reference_tss = load_tss(tss_beds_list)
    
    if args.reads_to_exclude:  
        print(f'loading reads to filter from {args.reads_to_exclude}') 
        reads_to_filter = load_reads_to_filter(args.reads_to_exclude)
        
    else:
        reads_to_filter = []
    print(f'{len(reads_to_filter)} reads to exclude')

    if not os.path.exists(args.outdir):
        os.makedirs(args.outdir)
    outfile = os.path.join(args.outdir, f'{args.prefix}.tsv')

    jaccard, obs_n, intersection, union = jaccard_nascent_rna(args.bam_file, reference_tss, reads_to_filter)

    with open(outfile, 'w') as outfile:
        outfile.write(f'jaccard\treference_unique_tss\tobserved_unique_tss\tintersection\tunion\n')
        outfile.write(f'{jaccard}\t{total_reference_tss}\t{obs_n}\t{intersection}\t{union}\n')

    outfile.close()

