#
# Set up a tabulation shortcut. Makes life a lot easier.
#
# Tabulates an sorts single column to compute occurrances 
# of each element in the column. You could add it to your profile as well.
#
alias tabulate="sort | uniq -c | sort -k1,1 -rn | awk -v OFS='\t' '{ print \$2, \$1 }'"

# If test.txt contains
# A
# B
# A
# A

cat test.txt | tabulate
# A 3
# B 1

# Download the gene ontology.
curl -OL http://purl.obolibrary.org/obo/go.obo

# Download the gene association file.
curl -OL http://geneontology.org/gene-associations/gene_association.goa_human.gz
    
# Unpack and rename the file to be easier to handle
gunzip gene_association.goa_human.gz 

# Remove comment lines and create a new file.
cat gene_association.goa_human | grep -v '!' > assoc.txt

# How many gene <-> association mappings?
cat assoc.txt | wc -l
# 491349

# How many unique gene names in the file?.
cat assoc.txt | cut -f 3 | tabulate | wc -l
# 19484

# How many unique protein names in the file?.
cat assoc.txt | cut -f 2 | tabulate | wc -l 
# 46728

# View and investigate the assoc.txt file.
# How many lines match the gene name BRCA1?
# (breast cancer type 1 susceptibility protein)
cat assoc.txt | grep BRCA1 | wc -l 
# 687
  
# What are the most annotated proteins in the dataset?
cat assoc.txt | cut -f 2 | tabulate | head
# P04637 618
# P62993 603
# P00533 540
# P0CG48 469
# P35222 443

# What are the most annotated genes in the dataset?
cat assoc.txt | cut -f 3 | tabulate | head
# HLA-B   1321
# HLA-A    920
# TP53     819
# HLA-DRB1 819
# GRB2     603
# ...

# How many gene products for gene name TP53?
cat assoc.txt | cut -f 2,3 | awk ' $2=="TP53" { print }'  | cut -f 1 | tabulate
# P04637     618
# A0A087X1Q1  19
# A0A087WZU8  19
# J3KP33 18
# E9PFT5 18
# ...

#
# How many annotations per year?
#
# Column 14 contains the date in the format YYYYMMDD example: `20140313`
# Extract and transform that column, then tabulate it.
# We cannot use the original tabulation as now we need to sort on years not counts.
cat assoc.txt | cut -f 14 | awk '{ print substr($1, 1, 4) }' | sort | uniq -c | sort -k 2,2 -n  | awk '{ print $2, $1 } '
# 2000     6
# 2001  2005
# 2002  1101
# 2003 11191
# 2004  3476
# 2005  4638
# 2006  8469
# 2007  5159
# 2008  9703
# 2009 13127
# 2010 16152
# 2011 25518
# 2012 17099
# 2013 71442
# 2014 55464
# 2015 246799

