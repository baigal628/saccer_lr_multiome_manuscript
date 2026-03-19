import numpy as np
import matplotlib.pyplot as plt
gtf = '/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_sorted.bed'
outbed = open('/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_genes_with_introns.bed', 'w')
c = 0
exon_sizess = []
intron_sizess = []
with open(gtf, 'r') as infile:
    for line in infile:
        readline = line.strip().split('\t')
        chr = readline[0]
        if chr == 'chrM':
            continue
        exon_c = int(readline[9])
        if exon_c > 1:
            exon_starts = np.array([int(i) for i in readline[11].split(",") if i], dtype=int)
            exon_sizes = np.array([int(i) for i in readline[10].split(",") if i], dtype=int)
            exon_ends = exon_starts + exon_sizes
            intron_sizes = exon_starts[1:] - exon_ends[:-1]
            exon_sizess.extend(exon_sizes.tolist())
            intron_sizess.extend(intron_sizes.tolist())
            gene_name = line.strip().split('\t')[3]
            outbed.write(line)
outbed.close()


plt.hist(exon_sizess, bins=np.arange(0,3000,50), color='tab:blue', alpha=0.5, label='exon sizes', density=True)
plt.hist(intron_sizess, bins=np.arange(0,3000,50), color='tab:red', alpha=0.5, label='intron sizes', density=True)
plt.xlabel('Size')
plt.title('Distribution of exon and intron sizes')
plt.ylabel('Density')
plt.xlim(0, 3000)
plt.legend()
plt.savefig('/private/groups/brookslab/gabai/projects/yeastMeth/figures/250407_ares_v13_exon_intron_sizes_in_intron_genes.pdf', dpi=300)


# get coordinates of 5'SS and 3'SS for genes with introns
gtf = '/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_genes_with_introns.bed'
outf_ss5 = open('/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_ss5.bed', 'w')
outf_ss3 = open('/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_ss3.bed', 'w')
with open(gtf, 'r') as infile:
    for line in infile:
        line = line.strip().split('\t')
        chrom = line[0]
        txStart = int(line[1])
        txEnd = int(line[2])
        gene_name = line[3]
        strand = line[5]
        exon_starts = np.array([int(i) for i in line[11].split(",") if i], dtype=int) + txStart
        exon_sizes = np.array([int(i) for i in line[10].split(",") if i], dtype=int)
        exon_ends = exon_starts + exon_sizes
        intron_sizes = exon_starts[1:] - exon_ends[:-1]
        if strand == '+':
            # 5'SS, 3'SS are the last base of the exon and the first base of the next exon
            ss_5s = [(ss_5, ss_5+1, e_size, i_size) for ss_5, e_size, i_size in zip(exon_ends[:-1], exon_sizes[:-1], intron_sizes)]
            ss_3s = [(ss_3, ss_3+1, e_size, i_size) for ss_3, e_size, i_size in zip(exon_starts[1:], exon_ends[:-1], intron_sizes)]
        elif strand == '-':
            ss_5s = [(ss_5, ss_5+1, e_size, i_size) for ss_5, e_size, i_size in zip(exon_starts[1:][::-1], exon_sizes[1:][::-1], intron_sizes[::-1])]
            ss_3s = [(ss_3, ss_3+1, e_size, i_size) for ss_3, e_size, i_size in zip(exon_ends[:-1][::-1], exon_sizes[:-1][::-1], intron_sizes[::-1])]
        for i in range(len(ss_5s)):
            outf_ss5.write(f"{chrom}\t{ss_5s[i][0]}\t{ss_5s[i][1]}\t{gene_name}\t0\t{strand}\t{ss_5s[i][2]}\t{ss_5s[i][3]}\n")
            outf_ss3.write(f"{chrom}\t{ss_3s[i][0]}\t{ss_3s[i][1]}\t{gene_name}\t0\t{strand}\t{ss_3s[i][2]}\t{ss_3s[i][3]}\n")
outf_ss5.close()
outf_ss3.close()

