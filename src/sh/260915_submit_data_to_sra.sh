# mv all files to one folder
data_sub="/private/groups/brookslab/data.rep/multiomic_longread_yeast_data_submission/"

# move mature RNA teloprime data to one folder
for i in /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/teloprime/alignment/250915*trimmed.sorted.bam;
    do ln -s "$i" "$data_sub"
done

# move nascent RNA data to one folder
for i in /private/groups/brookslab/gabai/projects/yeastMeth/data/rna/nascentRNA/riboPool/alignment/250908_RiboPool_LSK114*_nRNA_trimmed.sorted.bam;
    do ln -s "$i" "$data_sub"
done

# move DNA fiberseq data to one folder
for i in /private/groups/brookslab/gabai/projects/yeastMeth/data/raw/full_data/*R10_movesout.pass.sorted.bam;
    do ln -s "$i" "$data_sub"
done

# move short-read RNA data to one folder
for i in /private/groups/brookslab/data.rep/yeast_shortread_rnaseq/*.fastq.gz;
    do ln -s "$i" "$data_sub"
done

/private/home/gabai/.aspera/connect/bin/ascp -i \
    /private/groups/brookslab/gabai/tools/aspera.openssh \
    -QT -l100m -k1 \
    -d $data_sub \
    subasp@upload.ncbi.nlm.nih.gov:uploads/gabai_ucsc.edu_KZMjlMb7
