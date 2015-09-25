#
# Using the Entrez Taxonomy
#
# Wondrous things are possible if one
# were to learn the intricacies of the output processing with xtract.
#
# Find the scientific name of multiple taxonomy ids.
#
efetch -db taxonomy -id 9606,7227,10090 -format xml | xtract -Pattern Taxon -first TaxId ScientificName GenbankCommonName Division

#
# Can we go back and find taxid from Scientific Name?
#

#
# More interesting use cases with NCBI Taxonomy.
#