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
cond_1 = c("control", "control", "control")
cond_2 = c("treatment", "treatment", "treatment")

# Code does not need to change below.
conditions  = factor(c(cond_1, cond_2))

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

# Round the numbers more nicely
#sorted = format(sorted, digits=2)

# Write the results to the standard output
write.table(sorted, file="", sep="\t", row.name=FALSE, quote=FALSE)


