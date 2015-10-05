#
# Find the mutations in the polymerase gene between
# the 1976 and the many strains of the 2014 outbreak.
#
# Get the ebola genome for the 1976 outbreak.
efetch -db nuccore -id AF086833 -format gb  > AF086833.gb

# We want to obtain the sequence for the polymerase.
# We could look for its accession number.
# For example we can search through the genbank file and find the 
# accession number for it: AAD14589 with grep.
# -A and -B makes grep print lines before and after a match.
cat AF086833.gb | grep -B 5 -A 5 polymerase

# Using the accession number we can download the protein 
# sequence and store it in file L.fa.
# This file will be our query.
efetch -db protein -id  AAD14589 -format fasta  >  L.fa

# We could have also done this differently and extract it L
# with EMBOSS tools. In this case ends up being a more complicated.
# Also note that this sequence now does contain the stop codon!
extractfeat AF086833.gb -filter -type CDS -tag gene -value L | transeq -filter > L.fa

# Obtain all the proteins submitted  for the 2014 Ebola outbreak.
# Place it in a different directory so that blast index files
# don't get in the way.
mkdir -p index
esearch -db protein -query PRJNA257197 | efetch -format fasta > index/all-proteins.fa

# With EMBOSS installed you can get information on a sequence file.
infoseq index/all-proteins.fa
# USA   Database   Name  Accession  Type  Length  Organism  Description
# fasta::index/all-proteins.fa:AKC37233.1 -  AKC37233.1  AKC37233  P  2212   polymerase [Zaire ebolavirus]
# fasta::index/all-proteins.fa:AKC37232.1 -  AKC37232.1  AKC37232  P   251   VP24 [Zaire ebolavirus]
# fasta::index/all-proteins.fa:AKC37231.1 -  AKC37231.1  AKC37231  P   288   VP30 [Zaire ebolavirus]

# How many sequences match the word polymerase?
infoseq index/all-proteins.fa | grep polymerase | wc -l
# 264

# Build the blast index.
makeblastdb -in index/all-proteins.fa -dbtype prot -out index/all

# Run the query.
blastp -db index/all -query L.fa
 
# Format the output differently.
blastp -db index/all -query L.fa -outfmt "7"

# Customize the output even more.
blastp -db index/all -query L.fa -outfmt "7 qseqid sseqid pident"

# Type 6 removes the headers. That can be handy when sorting.
# Three worst alignments. Sort will operate on starting with column 3 and numeric mode. 
blastp -db index/all -query L.fa -outfmt "6 qseqid sseqid pident" | sort -k3 -n | head -5

# Three best alignments
blastp -db index/all -query L.fa -outfmt "6 qseqid sseqid pident" | sort -k3 -rn | head -5

# btop produces a alignment summary.
blastp -db index/all -query L.fa -outfmt "6 qseqid sseqid pident btop" | head 