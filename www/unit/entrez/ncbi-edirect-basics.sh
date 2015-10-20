#
# Get the data in genbank and fasta formats.
#
efetch -db=nuccore -format=gb -id=AF086833 > AF086833.gb
efetch -db=nuccore -format=fasta -id=AF086833 > AF086833.fa

#
# Select a subsection of the sequence.
#
efetch -db=nuccore -format=fasta -id=AF086833 -seq_start=1 -seq_stop=3

#
# Select either strands (labeled 1 or 2).
#
# Investigate the sequence that you get when strand=2.
# In what relation is to the sequence on strand=1?
#
efetch -db=nuccore -format=fasta -id=AF086833 -seq_start=1 -seq_stop=5 -strand=1
efetch -db=nuccore -format=fasta -id=AF086833 -seq_start=1 -seq_stop=5 -strand=2
