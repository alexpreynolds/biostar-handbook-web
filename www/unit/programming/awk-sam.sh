# Process a SAM file with awk.
# Reference file.
REF=~/refs/ebola/1976.fa

# Get the ebola genome of the 1976 outbreak. Index it with bwa.
mkdir -p ~/refs/ebola
efetch -db=nuccore -format=fasta -id=AF086833 > $REF
bwa index $REF

# Get sequencing data for the 2014 outbreak.
fastq-dump -X 15000 --split-files SRR1553425

alias bam='samtools view -b - | samtools sort -o - booyah'

# One step BAM conversion and sort.
bwa mem $REF SRR1553425_1.fastq SRR1553425_2.fastq | bam > results.bam

# Select columns from the samfile
samtools view results.sam | awk ' { print $6 }' | head

# The ~ operator is a regular expression match
samtools view results.sam | awk ' $6 ~ "D" { print $6 }' | head

# A tab aware awk.
alias tawk="awk -F '\t' -v OFS='\t'"

# View the alignment strings.
samtools view results.sam | tawk ' $6 ~ "D" { print $6, $12, $13 }' | head

# Select alignment with an edit distance of 3
samtools view results.sam | tawk ' $12 ~ "NM:i:3" { print $6, $12, $13 }' | head

# How many coordinates have a coverage over 150
samtools depth results.bam | awk ' $3 > 150 { print } ' | wc -l