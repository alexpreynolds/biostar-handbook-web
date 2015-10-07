# Store your blast databases in
# a dedicated folder.
mkdir -p ~/refs/refseq
cd ~/refs/refseq/

# Since blast database downloads are so common
# the blast package includes an update script.
update_blastdb.pl --showall

# Download the 16 microbial database.
update_blastdb.pl 16SMicrobial --decompress

# Download the taxonomy database
update_blastdb.pl taxdb --decompress

# Tell blast where to look for the additional taxonomy files.
# Add this to your bash profile like other variables.
export BLASTDB=$BLASTDB:~/refs/refseq/

# Download the nt database.
# This may take a while since it is 33GB in total.
# update_blastdb.pl nt --decompress

#
# We can perform the exercises with 16Microbial or
# the entire nt database.
#

# Get some information on the 16S Microbial database.
blastdbcmd -db ~/refs/refseq/16SMicrobial -info

# What is the first sequence in the file
blastdbcmd -db ~/refs/refseq/16SMicrobial -entry 'all' | head
# Shows the accession number NR_118889.1

# You could always get a named entry
blastdbcmd -db ~/refs/refseq/16SMicrobial -entry 'NR_118889.1'

# Which publication links to  this sequence?
esearch -db nuccore -query NR_118889.1 | elink -target pubmed | efetch

# Read the help on blastdbcmd
blastdbcmd -help | more

# We can reformat the blastdbcmd output.
blastdbcmd -db ~/refs/refseq/16SMicrobial -entry 'all' -outfmt '%a %l'

# Let's tabulate all.
# Add the , separator since we cannot easily enter a tab character into
# the shell. the tr command translates each , into a tab
blastdbcmd -db ~/refs/refseq/16SMicrobial -entry 'all' -outfmt '%a,%l,%T,%L' | tr ',' '\t' > 16genes.txt

# What organism has the longest 16S gene?
cat 16genes.txt | sort -k2,2 -rn | head

# Note how these two number are not the same
blastdbcmd -db ~/refs/refseq/16SMicrobial -entry 'all' | grep ">" | wc -l
# 17624

cat 16genes.txt | wc -l
# 17929

# Get the first 20 bases of each 16S gene.
blastdbcmd -db ~/refs/refseq/16SMicrobial -entry 'NR_118889.1' -range 1-20

# We can format the output for it as well.
blastdbcmd -db ~/refs/refseq/16SMicrobial -entry 'NR_118889.1' -range 1-20 -outfmt "%s"

# Get it for all sequences.
blastdbcmd -db ~/refs/refseq/16SMicrobial -entry 'all' -range 1-50 -outfmt "%s" | head

# How many unique gene starts are there?
blastdbcmd -db ~/refs/refseq/16SMicrobial -entry 'all' -range 1-50 -outfmt "%s"  > starts.txt

cat starts.txt | sort | uniq | wc -l
# 10045

# We could make a nice shortcut if we wanted to and call it tabulate.
# It runs the sort | uniq -c | sort pattern but then also swaps the columns
# and tab separates it to put the object first and counts second.
alias tabulate="sort | uniq -c | sort -k1,1 -rn | awk -v OFS='\t' '{ print \$2, \$1 }'"

# What is the most frequent gene start?
cat starts.txt | tabulate | head
# AGAGTTTGATCCTGGCTCAGGACGAACGCTGGCGGCGTGCTTAACACATG	275
# AGAGTTTGATCCTGGCTCAGGACGAACGCTGGCGGCGTGCCTAATACATG	143
# GACGAACGCTGGCGGCGTGCTTAACACATGCAAGTCGAGCGGTAAGGCCC	126
# ATTCCGGTTGATCCTGCCGGAGGCCATTGCTATCGGAGTCCGATTTAGCC	99
# AGAGTTTGATCATGGCTCAGATTGAACGCTGGCGGCAGGCCTAACACATG	98

# Get all proteins for the PRJNA257197 project.
mkdir -p index
esearch -db protein -query PRJNA257197 | efetch -format fasta > index/prots.fa
esearch -db nuccore -query PRJNA257197 | efetch -format fasta > index/genomes.fa

# Create the blast databases from them.
# It is essential that we add the -parse_seqids option
# to make use of additional features in blast.
makeblastdb -in index/prots.fa -dbtype prot -out index/prots -parse_seqids
makeblastdb -in index/genomes.fa -dbtype nucl -out index/genomes -parse_seqids


