
# Get the sequence the 1976 Ebola virus of Mayinga, Zaire
efetch -db=nuccore -format=fasta -id=AF086833 > ebola-1976.fa

# Select a subsequence of the virus.
seqret ebola-1976.fa -filter -sbegin 1 -send 10

# Reverse complement a sequence.
seqret ebola-1976.fa -filter -sbegin 1 -send 10 -srev

# Get the Ebola genbank file.
efetch -db=nuccore -format=gb -id=AF086833 > 1976.gb

# Turn a genbank file into gff3.
cat 1976.gb | seqret -filter -feature -osformat gff3 | head

