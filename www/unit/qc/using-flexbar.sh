

# Here is trimming with flexbar.
flexbar -r SRR519926_1.fastq -q 30 -f sanger

# Create a quality control plot.
fastqc flexbar.fastq

flexbar -r SRR519926_1.fastq -q 30 -f sanger --adapter-min-overlap 7 --adapter-trim-end RIGHT --adapters adapter.fa

# Run the quality control plot again.
fastqc flexbar.fastq
