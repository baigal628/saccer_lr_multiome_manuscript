import numpy as np
import matplotlib.pyplot as plt

def filter_exon(gtf, split_point = (300, 600)):
    """
    Filter exon and intron sizes from a gtf file.
    Args:
        gtf (str): Path to the gtf file.
        split_point (tuple): Tuple containing the lower and upper bounds for filtering exon sizes.
    """
    outf_low = open(gtf.split('.bed')[0]+f'_less_than_{split_point[0]}.bed', 'w')
    outf_up = open(gtf.split('.bed')[0]+f'_larger_than_{split_point[1]}.bed', 'w')
    outf_middle = open(gtf.split('.bed')[0]+f'_between_{split_point[0]}_{split_point[1]}.bed', 'w')
    with open(gtf, 'r') as infile:
        for line in infile:
            readline = line.strip().split('\t')
            exon_size = int(readline[6])
            if exon_size < split_point[0]:
                outf_low.write(line)
            elif exon_size > split_point[1]:
                outf_up.write(line)
            else:
                outf_middle.write(line)
    outf_low.close()
    outf_up.close()
    outf_middle.close()
    print(f"Filtered exon sizes into three files based on the split point {split_point}.")

if __name__ == "__main__":
    # Example usage
    gtf = '/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_ss3.bed'
    split_point = (300, 600)
    filter_exon(gtf, split_point)

    gtf = '/private/groups/brookslab/gabai/projects/yeastMeth/data/ref/sacCer3_ares_v13_ss5.bed'
    filter_exon(gtf, split_point)