# Get the genomic build for the ebola 2014 sequence.
mkdir -p ~/refs/ebola
REF=~/refs/ebola/2014.fa
# We need to rename the sequence id to match UCSC chromosomal coordinates.
efetch -db=nuccore -format=fasta -id=KM034562.1 | seqret -filter -sid KM034562v1 > $REF
# Index the reference so that we can align against it.
bwa index $REF

# Also index it with bowtie2
bowtie2-build $REF $REF

# Create a paired end query
# Samtools can also be used to extract sequences
# Index yet again. Note how each tool needs its own index to work.
# It creates a *.fai file.
samtools faidx $REF

# See all indices for our datasets
# There are just maybe two original data files there, all
# the rest are indices that correspond to different tools.
ls ~/refs/ebola

# Generate a read pair
# Sequence in file 1
# We need to name the sequences the same way to indicate read pairing
# for the aligner.
samtools faidx $REF KM034562v1:1-100 | seqret -filter -sid pair1 > read_1.fa

# Sequence in file 2. We have to reverse complement it.
samtools faidx $REF KM034562v1:1001-1100 | seqret -filter -srev -sid pair1 > read_2.fa

# Run an alignment with the current data.
bwa mem $REF 2> /dev/null read_1.fa read_2.fa

# View and understand the flags.
samtools flags 97
samtools flags 145

# Pass a different insert size, note the flag changes
# Samtools is trying to tell us which reads are within expected
# Fragment size
bwa mem -I 1000 $REF 2> /dev/null read_1.fa read_2.fa
samtools flags 99
samtools flags 147

# Read groups
# When processing samples we may need to add information about the samples
# into the alignment itself. These are called read-groups.
# @RG
#     ID: Unique
#     SM: Sample name
#     LB: Library preparation

# Add a RG:Z: simple tag to the alignment via bwa.
bwa mem -R '@RG\tID:simple\tSM:my sample\tLB:my library' $REF read_1.fa read_2.fa

# With bioawk we can access fields directly.
bwa mem $REF 2> log read_1.fa read_2.fa > out.sam
cat out.sam | bioawk  -c sam '{ print $rnext, $pnext, $tlen }'

# Extract reverse complement sequences that match the original data
cat out.sam  | bioawk  -c sam ' and($flag, 16) { $seq = revcomp($seq) } { print $seq }'

# Also an alternative way to extract reads from alignment
samtools bam2fq out.sam

# Split data by alignment strand
# All original data that aligns to forward strand
# Needs the -h flag to produce full SAM headers.
samtools view -h -F 16 out.sam | samtools bam2fq -

# All original data that aligns to reverse strand
samtools view -h -f 16 out.sam | samtools bam2fq -

# Start up our read simulator wgsim, dwgsim
# The two tools work in similar fashion one is by Heng Li
# the other by Nils Homer
wgsim

# Simulate 1000 reads with the error rate of 1%

wgsim -N 1000 -e 0.01 -1 100 -2 100 ~/refs/ebola/2014.fa sim1.fq sim2.fq > simulation.txt

# You can use the alias bam
alias bam='samtools view -b - | samtools sort -o - booyah'

# Aliases are not expanded in non-interactive scripts
# Best to create a script for it like so
echo '#!/bin/bash' > ~/bin/bam
echo 'samtools view -b - | samtools sort -o - booyah' >> ~/bin/bam
chmod +x ~/bin/bam

# Align the simulation results
bwa mem $REF sim1.fq sim2.fq | bam >  results-bwa.bam
samtools index results-bwa.bam

bowtie2 -x $REF -1 sim1.fq sim2.fq | bam > results-bowtie2.bam
samtools index results-bowtie2.bam

# We can slice the alignment anywhere
samtools view -c results-bwa.bam KM034562v1:10,000-10,001

# How many reads did not align?
samtools view -c -f 4 results-bwa.bam
samtools view -c -f 4 results-bowtie2.bam
