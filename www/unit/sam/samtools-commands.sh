REF=~/refs/ebola/1976.fa

# Get the ebola genome of the 1976 outbreak. Index it with bwa.
mkdir -p ~/refs/ebola
efetch -db=nuccore -format=fasta -id=AF086833 > $REF
bwa index $REF

# Get sequencing data for the 2014 outbreak.
fastq-dump -X 15000 --split-files SRR1553425

# We typically run a quality filter at this time
# but we'll ignore that for simplicity and move onto aligment step.
bwa mem $REF SRR1553425_1.fastq SRR1553425_2.fastq > results.sam

# Turn the samfile into a bamfile.
# Since this file will need to be sorted well call it
# temp.bam (temporary stage)
samtools view -b results.sam > temp.bam

# Sort the samfile by position.
# Samtools sort is the "black-eye" of samtools.
# Its invocation can be confusing.
# This command below sorts temp.bam and creates
# the results.bam.
samtools sort temp.bam results

# We need to index the results.bam file
samtools index results.bam

# Here is a neat trick to do all that in one step.
# The booyah is not actually used but it is required
# some word to be there, I know it is ... odd, to say the least.
alias bam='samtools view -b - | samtools sort -o - booyah'

# Hallelujah! We now can do a one step conversion and sort.
bwa mem $REF SRR1553425_1.fastq SRR1553425_2.fastq | bam > results.bam

# Still needs indexing.
samtools index results.bam

# What can samtools do?
samtools

# What options does samtools view take?
samtools view

# View the bam file
samtools view results.bam | head

# View only entries that have flag 4
samtools view -f 4 results.bam | head

# Count entries that have flag 4 (keep alignment with flag 4)
samtools view -c -f 4 results.bam

# Count entries that DO NOT have flag 4 (remove alignments with flag 4)
samtools view -c -F 4 results.bam

# Explain SAM flags
# https://broadinstitute.github.io/picard/explain-flags.html

# You can also convert flags at the command line.
samtools flags

# This will tell you the number
samtools flags REVERSE

# Mapping quality over 1. For BWA that means uniquely mapping.
samtools view -c -q 1 results.bam

# Mapping quality over 1 and on the reverse strand.
samtools view -c -q 1 -f 16 results.bam

# Mapping quality over 1 and on the forward strand.
samtools view -c -q 1 -F 16 results.bam

# We can build complex statements via the flags:
# Mapping quality over 1 + read is paired  + read maps in proper pair +
# read maps to reverse strand + read mate is also on reverse strand.
#
# This is a weird case actually. Could be either be an interesting
# case or just some systematic sequencing error ... usually is the latter.
samtools flags PAIRED,PROPER_PAIR,REVERSE,MREVERSE

samtools view -c -q 1 -f 51 results.bam

# Select the odd  reads now.
# Convert to bam with -b (this is easy to forget).
samtools view -b -q 1 -f 51 results.bam > weird.bam
samtools index weird.bam

# Compute the depth of coverage.
samtools depth results.bam  | head

# We could sort by depth though that
# (depending on genome size could take a long time)
# Find the highest covered region
samtools depth results.bam  | sort -k 3 -rn | head

# Normally we would filter for some minimal level of
# coverage first.

# We can even view the alignments.
samtools tview

# Press ? to get a help screen.
# Press q to exit the viewer.
samtools tview results.bam $REF

# Start the viewer at some position in the genome.
# Now complicated chromosme names are vey annoying
# Here we have gi|10141003|gb|AF086833.2| people
# usually rename their chromosomes (before the whole process starts)
# to make it easier to access a locatoin. We'll use what we have here.
samtools tview -p "gi|10141003|gb|AF086833.2|:10000" results.bam $REF

# Save the output of the view into a text file.
samtools tview -p "gi|10141003|gb|AF086833.2|:100" -d t results.bam $REF  > alignment.txt

# Save the output of the view into an html file.
samtools tview -p "gi|10141003|gb|AF086833.2|:100" -d h results.bam $REF  > alignment.html

# Other reporting commands
#
samtools flagstat results.bam

# reference sequence name, sequence length, number of mapped reads and # unmapped reads.
# How can a read be "unmapped" to a reference?
# https://www.biostars.org/p/14569/#14570
samtools idxstats results.bam