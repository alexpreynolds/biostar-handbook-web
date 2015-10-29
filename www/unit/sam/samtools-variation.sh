REF=~/refs/ebola/2014.fa
SIM=edited.fa

#
# make a copy of your genome, 
# that you can also edit to introduce certain features into it
# generate data from this genome then map it back to the reference
#
alias reset_genome='cp -f $REF $SIM'

# Set up shortcuts to simulate mutated genomes.
alias bam='samtools view -b - | samtools sort -o - booyah'
alias simulate='dwgsim -N 5000 $SIM data'
alias megaton='bwa mem $REF data.bwa.read1.fastq data.bwa.read2.fastq | bam > results.bam; samtools index results.bam'

# Simulate a megaton worth of information
# View the results in IGV
reset_genome; simulate; megaton

#
# Among the most difficult tasks are those to reverse engineering what we see
# when compared to the reference aka "the illusion"
# 
# Example: a sequence duplication event adds the beginning of the genome
# to the end of it. How can we detect that from the alignments?
cat $REF | head -10 | tail -9 >> edited.fa
simulate; megaton

# Reset the genome and try a different modification. What does this do?
# What can you see in your alignments?
reset_genome;
cat $REF | head -10 | seqret -filter -srev | tail -9 >> edited.fa
simulate; megaton

# Select reads in the "wrong" orientation.
samtools flags UNMAP,REVERSE,MREVERSE
samtools view -c -F 52  results.bam

samtools view -b -F 52 results.bam > FF.bam
samtools index FF.bam 



