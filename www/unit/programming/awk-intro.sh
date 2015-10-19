# Get the Ebola genbank file.
efetch -db=nuccore -format=gb -id=AF086833 > 1976.gb

# Reformat the file to GFF
# Run readseq with the -p (pipe) flag to make it use stdin and stdout
cat 1976.gb | readseq -p -f gff  | head

# Turn genbank into gff
cat 1976.gb | readseq -p -f gff  > 1976.gff

# Turn genbank into fasta
cat 1976.gb | readseq -p -f fasta > 1976.fa

# Can you reverse the transformations?
# Check to see what got lost in translation.
cat 1976.gff | readseq -p -f gb | head

# Compare the two outputs
cat 1976.gff | cut -f 4 | head -5
cat 1976.gff | awk '{ print $4 } ' | head

# Awk can match patterns then executes the action on the pattern itself.
# Feature type is in column 3, gene start and ends are in column 4 and 5.
# Match on column 3 and when that is true print columns 4 and 5.
cat 1976.gff | awk ' $3 == "gene" { print $4, $5 } '

# Length of all genes, plus the attribute column.
# By default awk splits on all whitespace. This can be desired or bad.
cat 1976.gff | awk ' $3 == "gene" { print $5 - $4 + 1, $10 } '

# Task: sort the genes by lenghts.

# FS field separator, OFS output field separator.
# Make awk split on tabs and separate its output with tabs.
cat 1976.gff | awk -F '\t' -v OFS='\t' '$3 == "gene" { print $9, $5 - $4 + 1}'

# You could create tawk: awk with tabular handling
alias tawk=awk -F '\t' -v OFS='\t'

# Makes for a simpler invocation. Keep the two 'awks' separate.
# Some code you read requires basic awk, others tabular awk.
cat 1976.gff | tawk ' $3 == "gene" { print $5 - $4 + 1, $9 }'

# Split the 9th column by space.
# Put the results in the array called X. Print the 2nd element of X.
cat 1976.gff | tawk ' $3 == "gene" { split($9, X, " "); print X[2], $5 - $4 + 1 } '

# Make the output nicer, remove the double quotes ".
cat 1976.gff | tawk ' $3 == "gene" { split($9, X, " "); print X[2], $5 - $4 + 1 } ' | tr -d '"'

# Sort by gene lengths
cat 1976.gff | tawk ' $3 == "gene" { split($9, X, " "); print X[2], $5 - $4 + 1 } ' | tr -d '"' | sort -k2,2 -rn


