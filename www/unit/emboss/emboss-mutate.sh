# msbar is an emboss tool to mutate a sequence
#
# Parameters:
#
# -point  Types of point mutations to perform
#         0 None
#         1 Any of the following
#         2 Insertions
#         3 Deletions
#         4 Changes
#         5 Duplications
#         6 Moves
#
# -sid changes the name of the sequence
#
#
# - block Types of block mutations. Same values as -point
#
#
# -count How many times to perform the mutation
#
msbar input.fa -point 4 -sid mutated -filter > output.fa

# To see the effect of the mutation use
# a Smith Waterman aligner. It is possible
# for a mutation to change to the same base
# hence stay the same.
water input.fa output.fa -filter

# Now use a different aligner to investigate the same.
