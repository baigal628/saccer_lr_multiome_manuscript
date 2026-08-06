conda activate fiberseq-qc 


ys18_rep1="~/gabai/projects/yeastMeth/data/raw/full_data/230824_ys18_150UNuc_Rep1_R10_movesOut.pass.sorted.bam"

ys18_rep2="~/gabai/projects/yeastMeth/data/raw/full_data/230928_ys18_150UNuc_Rep2_R10_movesOut.pass.sorted.bam"

ym209_rep1="~/gabai/projects/yeastMeth/data/raw/full_data/230908_ym209_150UNUC_Rep1_R10_movesout.pass.sorted.bam"
ym209_rep2="~/gabai/projects/yeastMeth/data/raw/full_data/231006_ym209_150UNuc_Rep2_R10.pass.sorted.bam"


# ~/tools/fiberseq-qc/src/runall-qc.tcsh /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/fiberseq_qc ys18_rep1 "${ys18_rep1}"

# ~/tools/fiberseq-qc/src/runall-qc.tcsh /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/fiberseq_qc ym209_rep1 "${ym209_rep1}"

~/tools/fiberseq-qc/src/runall-qc.tcsh /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/fiberseq_qc ys18_rep2 "${ys18_rep2}"

~/tools/fiberseq-qc/src/runall-qc.tcsh /private/groups/brookslab/gabai/projects/yeastMeth/data/dna/fiberseq_qc ym209_rep2 "${ym209_rep2}"

