
#global-align.sh ACCAAACCCCCCCTCCCCCCGCT ACCAAACCCCCCCTCCCCCCGCT -gapopen 10


#global-align.sh ACCAAACCCCCCCTCCCCCCGCT ACCAAACCCCCCCCTCCCCCCCGCT -gapopen 10

#global-align.sh ACCAAACCCCCCCTCCCCCCGCT ACCAAACCCCCCCCTCCCCCCCGCT -gapopen 9

# Homo sapiens mitocondrial genome. First 1kb.
efetch -id NC_012920.1 -db nuccore -format fasta | seqret -filter -sid mito -sbegin=1 send=1000 > mito.fa

# Extract 10 bases from around position 310
cat mito.fa | seqret -filter -sbegin 300 -send 320

# This is what it should look like
#
#   REF:  CCAAACCCCCCCTCCCCCGCTTC
#
# Mutate the sequence by inserting a C on both sides of the T
#
#   REF:  CCAAACCCCCCC-T-CCCCCGCTTC
#   REAL: CCAAACCCCCCCCTCCCCCCGCTTC


local-align.sh CCAAACCCCCCCTCCCCCGCTTC CCAAACCCCCCCCTCCCCCCGCTTC

local-align.sh CCAAACCCCCCCTCCCCCGCTTC CCAAACCCCCCCCTCCCCCCGCTTC -gapopen 9

# Replace the T at position 310 with a CTC
echo ">ctc" > ctc.fa
echo "CTC" >> ctc.fa

REF=mito.fa
REAL=real.fa

cutseq -filter $REF -from 310 -to 310 > temp.fa
pasteseq -filter temp.fa ctc.fa -pos 309 > $REAL

alias generate_experimental_data='dwgsim -e 0 -E 0 -r 0 -R 0 -N 5000 $REAL experiment'
alias align_experimental_data='bwa mem -O 4 $REF experiment.bwa.read1.fastq experiment.bwa.read2.fastq | bam > experiment.bam; samtools index experiment.bam'

bwa index $REF

generate_experimental_data; align_experimental_data
