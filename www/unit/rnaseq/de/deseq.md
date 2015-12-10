The simplest DE Seq based differential expression calculator.
It needs to be customized for other problems.

	# This only needs to be run once
	#
	# Uncomment the two lines below to execute the installation.
	#
	# source("http://bioconductor.org/biocLite.R")
	# biocLite("DESeq")
	#

	# Load the library.
	library(DESeq)

	# The input file has tab delimited colums.
	input = "counts.txt"

	# The output file
	output = "deseq-results.txt"

	# Read the data from the file
	counts = read.table(input, header=TRUE, row.names=1 )

	# Set up the conditions. These are experiment specific.
	# In our case we have 3 + 3 replicates.
	cond1 = rep("control", 3)
	cond2 = rep("treatment", 3)
	condition  = factor(c(cond1, cond2))

	# Create a count table
	cds = newCountDataSet(counts, condition)

	# Estimate size factors.
	cds = estimateSizeFactors(cds)

	# Estimate dispersions
	cds = estimateDispersions(cds)

	# Compute a standard comparison
	results = nbinomTest(cds, "control", "treatment")

	# Sort the results data frame by the padj and foldChange columns.
	sorted = results[with(results, order(padj, -foldChange)), ]

	# Write the results into the file.
	write.table(sorted, file=output, sep="\t", row.name=FALSE, quote=FALSE)

	# Show the users where the results are.
	printf("Wrote results into %s", output)