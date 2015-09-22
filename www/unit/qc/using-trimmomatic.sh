
# Get a dataset
fastq-dump --split-files SRR519926

# Run fastqc reports on the data
fastqc SRR519926_1.fastq

# Trim with trimmomatic Single END mode
trimmomatic SE -phred33 SRR519926_1.fastq output.fq SLIDINGWINDOW:4:30 MINLEN:35 TRAILING:3

# Investigate what the result is.
fastqc trimmomatic_1.fq

# To perform the adapter cutting we need to find a file with adapter sequences.
# You can create your own adapter or use the ones that come with Trimmomatic
# Let's create an Illummina adapter file.
echo ">illumina" > adapter.fa
echo "AGATCGGAAGAG" >> adapter.fa

# Let's do both quality and adapter trimming.
trimmomatic SE SRR519926_1.fastq output.fq SLIDINGWINDOW:4:30 TRAILING:30 ILLUMINACLIP:adapter.fa:2:30:5


# Trimmomatic in paired end mode.
trimmomatic PE SRR519926_1.fastq SRR519926_2.fastq paired_1.fq unpaired_1.fq paired_2.fq unpaired_2.fq ILLUMINACLIP:adapter.fa:2:10:10 SLIDINGWINDOW:4:30 TRAILING:20