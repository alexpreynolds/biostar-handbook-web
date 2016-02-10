#
# Finding gene set enrichment.
#
# The visualization is ErmineJ: http://erminej.chibi.ubc.ca/

#
# We can also use the goatools command line package.
#
# For this tool we need to prepare a study set,
# a population (background) set and an association files.

# Get the GO file and the association files.
curl -OL curl -OL http://purl.obolibrary.org/obo/go.obo
curl -L http://geneontology.org/gene-associations/gene_association.goa_human.gz | gunzip | grep -v '!' > assoc.txt

# Our study set (genes of interest) contain
# the genes that are the most annotated.
# Question we want answered is: what
# is common about the most annotated genes?
cat assoc.txt | cut -f 3 | tabulate | head | cut -f 1 > study

# The population set contains all the genes.
cat assoc.txt | cut -f 3 | tabulate | cut -f 1 > population

# The association set contains the gene <-> association pairs.
cat assoc.txt | cut -f 3,4 > association

# To produce
find_enrichment.py study  population assoc --obo go.obo --no_propagate_counts > results.txt

# Find the PubMed ID for the DAVID publication in Nat Protoc.
esearch -db pubmed -query "DAVID Bioinformatics Resources[title] AND Nat Protoc. [journal]" | efetch
# PMID: 19131956

# Find all publications that link to this paper.

# Obtain the publications from PubMed.
esearch -db pubmed -query 19131956 | elink -name pubmed_pubmed_citedin -related | efetch -format docsum > citations.xml
# This will download information on 4886 papers

# Take the citations and extract only the year from the PubDate elements.
cat citations.xml | xtract -pattern DocumentSummary -element PubDate | cut -f 1 -d ' ' > cited_years.txt

# To find the way these are distributed over the years (ignoring 2015 as
# the year is not over yet:
cat cited_years.txt | sort | uniq -c | sort -k2,2 -n | awk '{ print $2, $1 }'
# 2009   55
# 2010  287
# 2011  554
# 2012  832
# 2013 1066
# 2014 1169