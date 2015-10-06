
# The first entry in the nt database
blastdbcmd -db ~/refs/refseq/nt -entry 'all' | head

# Find the paper that has
esearch -db nuccore -query X17276.1 | elink -target pubmed | efetch


# Dumpint the entire nt blast database.
# Takes 22 minutes on an iMac and about 4 hours on a MacBook Air.
# time blastdbcmd -db ~/refs/refseq/nt -entry 'all' -outfmt '%a,%l,%T,%L' | tr ',' '\t' > all.txt

#
# The file is
split -l 1000000 all.txt parts/

# Sort each piece individually
time ls parts/* | parallel --verbose --progress sort {} -o {}

# Merge the pieces back together.
ma