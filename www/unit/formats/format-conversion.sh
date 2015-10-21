# Get the Ebola genbank file.
efetch -db=nuccore -format=gb -id=AF086833 > 1976.gb

# We can convert formats with readseq
# Run readseq with the -p (pipe) flag to make it use stdin and stdout
cat 1976.gb | readseq -p -f gff  | head

# Convert genbank format into gff
cat 1976.gb | readseq -p -f gff  > 1976.gff

# Convert genbank format into fasta
cat 1976.gb | readseq -p -f fasta > 197

# We can also convert formats with seqret (EMBOSS)
# Turn a genbank file into fasta with seqret.
cat 1976.gb | seqret -filter -feature -osformat fasta | head

# Turn a genbank file into gff3 with seqret.
cat 1976.gb | seqret -filter -feature -osformat gff3 | head

