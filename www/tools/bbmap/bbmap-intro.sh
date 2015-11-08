# Prepare (index) the genome. This only needs to be done once.
# The path sets the index location.
bbmap.sh ref=~/refs/ebola/1976.fa path=~/refs/ebola/

# Take a look what files have been created.
ls ~/refs/ebola/

# Running bbmap.sh will provide help on its usage.
bbmap.sh

# Run the bbmap aligner. It will
# handle both fasta and fastq formats.
bbmap.sh in=query.fa path=~/refs/ebola out=query.sam