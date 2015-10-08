
# Create a test sequence.
echo '>myseq' > query.fa
echo 'GAAGAATTTTTAGGATCTTTTGTGTGCGAATAACTATGAGGAAGATTAATAA' >> query.fa

# Align and investigate.
bwa mem ~/refs/ebola/1976.fa query.fa

#
# Mutate the query and realign.
#
# -point  Types of point mutations to perform
#		  0 None
#         1 Any of the following
#		  2 Insertions
#         3 Deletions
#         4 Changes
#		  5 Duplications
#         6 Moves
msbar query.fa -filter -point 4 > mutated.fa

# Align the mutated query.
bwa mem ~/refs/ebola/1976.fa mutated.fa

