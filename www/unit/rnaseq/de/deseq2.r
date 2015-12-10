#source("http://bioconductor.org/biocLite.R")
#biocLite("DESeq2")

# Load the library.
library(DESeq2)

# input files
count_file = "counts.txt"
coldata_file = "design.txt"

# The output file
output = paste("deseq2-", "results.txt",sep="")

# Read the data from the files
count_matrix = read.table(count_file, header=TRUE, sep="\t", row.names=1 )

# Read the design file.
coldata = read.table(coldata_file, header=TRUE, sep="\t", row.names=1 )

# Create DESEq2 dataset.
dds = DESeqDataSetFromMatrix(countData=count_matrix,colData=coldata,design = ~condition)

#set the reference to be compared
dds$condition = relevel(dds$condition,"control")

# Run deseq
dds = DESeq(dds)

# Format the results.
res = results(dds)

# Sort the results data frame by the padj and foldChange columns.
sorted = res[with(res, order(padj, -log2FoldChange)), ]

# Write the table out.
write.table(sorted, file=output,sep="\t",col.names=NA,quote=FALSE)

