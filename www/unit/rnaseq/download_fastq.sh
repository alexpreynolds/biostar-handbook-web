# Downloading our RNA-seq data
#
# Our project ID is PRJNA246463
#
# Note that this data represents a time course;
# We are extracting two biological replicates
# for two time points giving us four samples total

# download 1000,000 reads for each sample
# sample 1 rep 1
fastq-dump --split-files -X 100000 SRR1275518
# sample 1 rep 2
fastq-dump --split-files -X 100000 SRR1275508
# sample 2 rep 1
fastq-dump --split-files -X 100000 SRR1275520
# sample 2 rep 2
fastq-dump --split-files -X 100000 SRR1275512

# rename the files to be recognizable
# and move them to appropriate directory
mkdir -p ./data/fastq
mkdir -p ./data/qc

# first sample read pairs
mv SRR1275518_1.fastq ./data/fastq/sample1_rep1_1.fq
mv SRR1275518_2.fastq ./data/fastq/sample1_rep1_2.fq
mv SRR1275508_1.fastq ./data/fastq/sample1_rep2_1.fq
mv SRR1275508_2.fastq ./data/fastq/sample1_rep2_2.fq

# second sample read pairs
mv SRR1275520_1.fastq ./data/fastq/sample2_rep1_1.fq
mv SRR1275520_2.fastq ./data/fastq/sample2_rep1_2.fq
mv SRR1275512_1.fastq ./data/fastq/sample2_rep1_1.fq
mv SRR1275512_2.fastq ./data/fastq/sample2_rep1_2.fq

# now let's run QC on all of our samples
fasqc --outdir ./data/qc ./data/fastq/sample{1,2}_rep{1,2}_{1,2}.fq
