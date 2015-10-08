# Prepare (index) the genome. This only needs to be done once.
# Bowtie indexing requires you to specify the index name.
bowtie2-build ~/refs/ebola/1976.fa ~/refs/ebola/1976

# Take a look what files have been created.
ls ~/refs/ebola/

# Running bwa will provide help on its usage.
bowtie2

# Run the bowtie2 aligner. By default
# Bowtie2 expects a fastq query, ours is fasta format
# hence we need the -f flag.
bowtie2 -x ~/refs/ebola/1976 -f -U query.fa
