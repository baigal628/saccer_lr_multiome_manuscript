# read bedtools coverage output for gene quantiles from 4 samples and make a table: each column is a sample, each row is a gene quantile
import os
import argparse
import pandas as pd

def read_coverage_file(cov_files, sample_names):
    cov_dict = {}
    for i, cov_file in enumerate(cov_files):
        sample_name = sample_names[i]
        with open(cov_file, 'r') as infile:
            for line in infile:
                line = line.strip().split('\t')
                geneid = line[3]
                coverage = float(line[6])  # assuming 7th column is coverage
                fraction = float(line[7])  # assuming 8th column is fraction covered
                if fraction < 0.2:
                    coverage = 0.0  # set coverage to 0 if less than 10% of gene quantile is covered
                if geneid not in cov_dict:
                    cov_dict[geneid] = {}
                cov_dict[geneid][sample_name] = coverage
    return cov_dict

def write_cov_table(cov_dict, sample_names, outdir, prefix):
    outfile = os.path.join(outdir, f"{prefix}_gene_quantile_coverage_table.tsv")
    with open(outfile, 'w') as outf:
        header = ['Gene_Quantile'] + sample_names
        outf.write('\t'.join(header) + '\n')
        for geneid in sorted(cov_dict.keys()):
            row = [geneid]
            for sample in sample_names:
                cov = cov_dict[geneid].get(sample, 0.0)
                row.append(str(cov))
            outf.write('\t'.join(row) + '\n')
    print(f"Written gene quantile coverage table to: {outfile}")

def main():
    parser = argparse.ArgumentParser(
        description="Make gene quantile coverage table from bedtools coverage outputs."
    )
    parser.add_argument(
        "-c", "--cov-files", nargs=4, required=True,
        help="List of 4 bedtools coverage output files for gene quantiles."
    )
    parser.add_argument(
        "-s", "--sample-names", nargs=4, required=True,
        help="List of 4 sample names corresponding to the coverage files."
    )
    parser.add_argument(
        "-o", "--outdir", required=True, help="Output directory"
    )
    parser.add_argument(
        "-p", "--prefix", default="gene_quantile", help="Prefix for output files (default: gene_quantile)"
    )

    args = parser.parse_args()

    if not os.path.exists(args.outdir):
        os.makedirs(args.outdir)

    cov_dict = read_coverage_file(args.cov_files, args.sample_names)
    write_cov_table(cov_dict, args.sample_names, args.outdir, args.prefix)

if __name__ == "__main__":
    main()