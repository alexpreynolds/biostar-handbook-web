# Prepare (index) the genome. This only needs to be done once.
bwa index ~/refs/ebola/1976.fa

# Take a look what files have been created.
ls ~/refs/ebola/

# Running bwa will provide help on its usage.
bwa

# Bwa uses subcommand mechanisms. A subcommand opens
# a new set of flags and options.
bwa mem

# Run the bwa aligner. The first parameter is the index
# the second parameter is the query. It will
# handle both fasta and fastq formats.
bwa mem ~/refs/ebola/1976.fa query.fa
