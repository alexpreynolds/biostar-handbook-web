
# Awk programming

# http://www.yeastgenome.org/download-data/curation
# We'll get rid of comment lines too.
curl http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff | grep -v "#" >  sc.gff

# Chromosome, origin, type.
cat sc.gff | cut -f 1,2,3 | head

# The same information with awk.
cat sc.gff | awk '{ print $1,$2,$3}' | head

# Filter by chromosome chrV
cat sc.gff | awk ' $1 == "chrV" { print $1,$2,$3 }' | head

# Get the gene start and end coordinates for chromosome V
cat sc.gff | awk ' $1 == "chrV" && $3=="gene" { print $1,$2,$3,$4,$5 }' | head

# Get gene lenghts on chromosome V
cat sc.gff | awk ' $1 == "chrV" && $3=="gene" { print $1,$3,$5-$4+1 }' | head

# Get the last column too. It has too much information.
cat sc.gff | awk ' $1 == "chrV" && $3=="gene" { print $1,$3,$5-$4+1,$9 }' | head

# Split the last column by ';' and keep first element.
cat sc.gff | awk ' $1 == "chrV" && $3=="gene" { split($9, X, ";"); print $1,$3,$5-$4+1,X[1] }' | head

# I need to split the resulting first element again.
cat sc.gff | awk ' $1 == "chrV" && $3=="gene" { split($9, X, ";"); split(X[1], Y, "="); print $1,$3,$5-$4+1,Y[2] }' | head

# Reorganize the columns, longest gene on chromosome 5
cat sc.gff | awk ' $1 == "chrV" && $3=="gene" { split($9, X, ";"); split(X[1], Y, "="); print $1,$3,Y[2], $5-$4+1 }' | sort -rn -k4,4 | head

# Special variables: $0 the whole line
cat sc.gff | awk '{ print $0}' | head

# We can mutate any field in the line. This can be handy.
cat sc.gff | awk '{ $9="booyah"; print $0}' | head

# NR: number of records, NF: number of fields per line
cat sc.gff | awk '{ print NR, NF}' | head

# The files contains other types of records.
cat sc.gff | awk '{ print NR, NF}' | tail

# Process only the 9 column records in the file.
cat sc.gff | awk ' NF == 9 { print NR, NF}' | tail

# Special patterns: BEGIN, END
cat sc.gff  |  awk ' BEGIN { print "*** start ***" } { print $1,$2,$3} END { print "*** stop ***" } ' | head

# Genome size, code region size
cat sc.gff  |  awk ' $3=="chromosome" { sum = sum + $5-$4 + 1 } END { print "Lenght of the genome is", sum  } '
# Lenght of the genome is 12157105

cat sc.gff  |  awk ' $3=="gene" { sum = sum + $5-$4 + 1 } END { print "Lenght of all genes is", sum  } '
# Lenght of all genes is 8882849

# By default awk splits on any white-space character.
# Sometimes that works in our favor, other times does not.
# This file is already tab separated so there will be no difference.
# In general it is best to tell awk to split on tabs -F `\t`
cat sc.gff | awk -F '\t' '{ print $1,$2,$3} ' | head

# -F field separator, OFS output field separator
# In addition it is best to tell awk to separate fields via tab as well.
cat sc.gff | awk -F '\t' -v OFS='\t' '{ print $1,$2,$3} ' | head

# Create an alias to tawk (awk that splits on tabs and outputs with tabs)
# Don't override awk itself as some tools will need the way it works by default.
# Put this into your profile.
alias tawk="awk -F '\t' -v OFS='\t'"

# It now works with tabs.
cat sc.gff | tawk '{ print $1,$2,$3} ' | head
