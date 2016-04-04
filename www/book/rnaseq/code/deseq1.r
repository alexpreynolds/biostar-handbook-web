# This only needs to be run once
#
# Uncomment the two lines below to execute the installation.
#
# source("http://bioconductor.org/biocLite.R")
# biocLite("DESeq")
#

# Load the library.
library(DESeq)

# Read the data from the file.
counts = read.table("stdin", header=TRUE, row.names=1 )

#
# Set up the conditions. These are experiment specific.
#
# In our case we have 3 + 3 replicates.
#
# The two lines below need to match the column identities in the file.
#
# First three columns are UHR the second three are HBR
control = rep("control", 3)
treatment = rep("treatment", 3)

# Code does not need to change below.
conditions = factor(c(control, treatment))

# Create a count table
cds = newCountDataSet(counts, conditions)

# Estimate size factors.
cds = estimateSizeFactors(cds)

# Estimate dispersions
cds = estimateDispersions(cds)

# Compute a standard comparison
results = nbinomTest(cds, "control", "treatment")

# Sort the results data frame by the padj and foldChange columns.
sorted = results[with(results, order(padj, -foldChange)), ]

# Write the results to the standard output
write.table(sorted, file="", sep="\t", row.name=FALSE, quote=FALSE)


