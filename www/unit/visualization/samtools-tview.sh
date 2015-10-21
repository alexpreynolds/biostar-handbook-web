# Data preparation.
#
# The rationale for the next few lines have been discussed before
# They are shown in a compact form to allow you to prepare the inputs
# by copy pasting into a terminal.
# These instructions will download the ebola genome that corresponds
# to the UCSC genome browser build,
# then download published data for the 2014 outbreak and prepare an alignment for them.
#
mkdir -p ~/refs/ebola
REF=~/refs/ebola/2014.fa
# We need to rename the sequence id to match UCSC.
efetch -db=nuccore -format=fasta -id=KM034562.1 | seqret -filter -sid KM034562v1 > $REF
bwa index $REF
fastq-dump -X 15000 --split-files SRR1553425
alias bam='samtools view -b - | samtools sort -o - booyah'
bwa mem $REF SRR1553425_1.fastq SRR1553425_2.fastq | bam > results.bam
samtools index results.bam

# We can view the alignments with samtools.
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
