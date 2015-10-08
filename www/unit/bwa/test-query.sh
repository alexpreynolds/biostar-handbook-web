# Get a reference genome to align against.
# Ebola genome 1976 Mayinga Zaire.

# Store references in a separate directory.
mkdir -p ~/refs/ebola
efetch -db=nuccore -format=fasta -id=AF086833 > ~/refs/ebola/1976.fa

# Take the first line of the Ebola data and
# create a query out of it.
cat ~/refs/ebola/1976.fa | head -2 > query.fa