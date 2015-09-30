
# Get a genome sequence for the Ebola virus
# Indexing genomes produces many other files.
# It is best if we place these in a separate folder. Lets call that refs.
mkdir -p ~/refs/ebola
efetch -db nucleotide -id KM233118 --format fasta > ~/refs/ebola/KM233118.fa

# The reference may contain one or more FASTA records.
# To turn it into a blast database we need to transform it to a
# format the program is able to operate on.

# See long and short help for the blast database indexer.
makeblastdb -h
makeblastdb -help

# Create a nucleotide database out of the genome.
# The output is typically named similary as the input
makeblastdb -in ~/refs/KM233118.fa -dbtype nucl -out ~/refs/ebola/KM233118

# We could name the output as something else as well.
makeblastdb -in ~/refs/KM233118.fa -dbtype nucl -out ~/refs/ebola/foo

# Let's see what files it has created.
ls ~/refs/ebola

# We can run a query against the database.
# Make the query the start of the genome.
echo ">test" > query.fa
echo "AATCATACCTGGTTTGTTTCAGAGCCATATCACCAAGAT" >> query.fa

# See what the file contains.
cat query.fq

# Run a blast search.
blastn -db ~/refs/ebola/KM233118 -query query.fa

# Redirect to a file.
blastn -db ~/refs/ebola/KM233118 -query query.fa > results.txt

# BLAST has many options. Usability is lacking.
# Hard to make sense of these options.
blastn -help

# You can format the outputs differently.
blastn -db ~/refs/ebola/KM233118 -query query.fa  -outfmt 7

# Add custom fields to the output.
blastn -db ~/refs/ebola/KM233118 -query query.fa  -outfmt "7 qseqid sseqid pident"

# BLAST makes use of certain preset paramters settings called
# search strategies. By default blastn uses the megablast
# search strategy.Shorten the query to:
echo ">short" > short.fa
echo "AATCATACCTGG" >> short.fa

# This will find no hits.
blastn -db ~/refs/ebola/KM233118 -query short.fa

# Run with different search strategy: blastn
blastn -db ~/refs/ebola/KM233118 -query short.fa -task blastn

# Make the sequence even shorter.
echo ">mini" > mini.fa
echo "AATCATA" >> mini.fa

# Now we need the blastn-short search strategy.
blastn -db ~/refs/ebola/KM233118 -query mini.fa -task blastn-short

# BLAST can also perform pairwise alignments.
blastn -query mini.fa -subject short.fa -task blastn-short