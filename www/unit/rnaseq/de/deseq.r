# This only needs to be run once
#
# Uncomment the two lines below to execute them.
#
# source("http://bioconductor.org/biocLite.R")
# biocLite("DESeq")
#


# Load the library.
library(DESeq)

# The input file has tab delimited colums.
input = "counts.txt"

# The output file
output = "results.csv"

# Read the data from the file
counts = read.table(input, header=TRUE, row.names=1 )

# Set up the conditions
# First column are the genes the rest need to be counts
cond1 = rep("control", 3)
cond2 = rep("treatment", 3)

condition  = factor(c(cond1, cond2))

# Create a count table
cds = newCountDataSet(counts, condition)

# Estimate size factors.
cds = estimateSizeFactors(cds)

# Estimate dispersions
cds = estimateDispersions(cds)

# Optionally plot the dispersion
plotDispEsts(cds)

# Compute a standard comparison
results = nbinomTest(cds, "control", "treatment")

write.csv(results, file=output )
