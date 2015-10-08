
# Get a reference genome to align against.
# Ebola genome 1976 Mayinga Zaire.

# Store references in a separate directory.
mkdir -p ~/refs/ebola

efetch -db=nuccore -format=fasta -id=AF086833 > ~/refs/ebola/1976.fa

# Prepare (index) the genome. This only needs to be done once.
bwa index ~/refs/ebola/1976.fa

# Take a look what files have been created.
ls ~/refs/ebola/

# Take the first line of the Ebola data and
# create a query out of it.
cat ~/refs/ebola/1976.fa | head -2 > query.fa

# Running bwa will provide help on its usage.
bwa

# Bwa uses subcommand mechanisms. A subcommand opens
# a new set of flags and options.
bwa mem

# Run the bwa aligner. The first parameter is the index
# the second parameter is the query.
# Heng Li's tools will handle fastq and fasta files without
# having to specify the format. Kudos!
bwa mem ~/refs/ebola/1976.fa query.fa
