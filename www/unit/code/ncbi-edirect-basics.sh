#
# Get the data in genbank and fasta formats
#
efetch -db=nuccore -format=gb -id=AF086833 > AF086833.gb
efetch -db=nuccore -format=fasta -id=AF086833 > AF086833.fa

#
# NCBI instructions state that we can select a subsection of the sequence
#
efetch -db=nuccore -format=fasta -id=AF086833 -seq_start=1 -seq_stop=3

#
# Or even strands.
#
# Always make sure you understand what each of these operations do.
#
efetch -db=nuccore -format=fasta -id=AF086833 -seq_start=1 -seq_stop=5 -strand=1
efetch -db=nuccore -format=fasta -id=AF086833 -seq_start=1 -seq_stop=5 -strand=2

# Investigate what the above does.

#
# Note that these still work, they raise a warning but that is easy to miss.
# In our opinion they should not. It is exceedingly easy to mess up a command line.
# and get results when you should have not.
#
efetch -db=nuccore -format=fasta -id=AF086833 -seq_start=foo -seq_stop=5 -strand=1 | head
efetch -db=nuccore -format=fasta -id=AF086833 -seq_start=1 -seq_stop=foo -strand=1 | head
efetch -db=nuccore -format=fasta -id=AF086833 -seq_start=1 -seq_stop=5 -strand=foo | head

