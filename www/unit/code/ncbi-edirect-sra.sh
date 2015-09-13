#
# Get run information from
#
# This is the Ebola project
#
esearch -db nucleotide -query PRJNA257197
esearch -db protein -query PRJNA257197

# Fetch the data for nucleotides in this project.
esearch -db nucleotide -query PRJNA257197 | efetch -format fasta > ebola.fasta