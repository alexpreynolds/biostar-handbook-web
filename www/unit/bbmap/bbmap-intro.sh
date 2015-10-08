# Get a reference genome to align against.
# Ebola genome 1976 Mayinga Zaire.

# Store references in a separate directory.
mkdir -p ~/refs/ebola

efetch -db=nuccore -format=fasta -id=AF086833 > ~/refs/ebola/1976.fa

# Prepare (index) the genome. This only needs to be done once.
# The path sets the index location.
bbmap.sh ref=~/refs/ebola/1976.fa path=~/refs/ebola/

# Take a look what files have been created.
ls ~/refs/ebola/

# Take the first line of the Ebola data and
# create a query out of it.
cat ~/refs/ebola/1976.fa | head -2 > query.fa

# Running bbmap.sh will provide help on its usage.
bbmap.sh

# Run the bbmap aligner.
bbmap.sh in=query.fa path=~/refs/ebola out=query.sam