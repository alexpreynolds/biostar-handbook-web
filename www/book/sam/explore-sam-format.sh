# Create an environment variable to simplify command invocation.
REF=~/refs/ebola/1976.fa

# Get and index the ebola genome.
mkdir -p ~/refs/ebola
efetch -db=nuccore -format=fasta -id=AF086833 > $REF

# Index with bwa.
bwa index $REF

# Create a test sequence.
echo '>myseq' > query.fa
echo 'GAAGAATTTTTAGGATCTTTTGTGTGCGAATAACTATGAGGAAGATTAAT' >> query.fa

# BWA is a fast semi-global aligner.
bwa mem $REF query.fa

# The output format is SAM.
bwa mem $REF query.fa > out.sam

# BWA writes the SAM file to the standard output
# but the progress reports are written to the so called
# standard error stream. You can separate the streams like so.
bwa mem $REF query.fa 2> progress.txt > out.sam

# Investigate the SAM headers.
bwa mem $REF query.fa  | grep @

# Investigate the SAM body.
bwa mem $REF query.fa | grep -v @

# Make an alias to shorten the command.
alias samfile='bwa mem $REF query.fa 2> progress.txt | grep -v @'

# First three columns: QNAME, FLAG, RNAME
samfile | cut -f 1,2,3

# Second three columns: POS, MAPQ, CIGAR
samfile | cut -f 4,5,6

# Third three columns: RNEXT, PNEXT, TLEN
# These are set only for paired end sequencing runs.
samfile | cut -f 7,8,9

# Last two columns: SEQ, QUAL
# No qualities in this case since it was a FASTA file.
samfile | cut -f 10,11

# The remaining columns are optional. Some of the most shared ones:
# NM: number of mismatches
# AS: Alignment score
# MD: Mismatching positions
# NH: Number of reported alignments that contains the query
# Read the SAM spec for the definition of TAG names that don't start with X.
# Read the aligner manual for the definition of TAG names that start with X
samfile | cut -f 12,13,14

# Mutate the query and realign.
# You may edit the sequence in an editor or use the msbar EMBOSS tool.
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
msbar query.fa -point 4 -sid mismatch -filter > mutated.fa

# Look at what mutations it has introduced.
water $REF mutated.fa -filter

# Create a shortcut to the BWA run on the mutated sequence.
alias mutalisk='bwa mem $REF mutated.fa 2> progress.txt | grep -v @'

# Investigate the mutated query.
# Getting your eyes ready to read a SAM file takes time.
mutalisk | cut -f 1,4,6,12,13

# Add more mutations.
msbar query.fa -point 4 -sid mismatch -count 3 -filter > mutated.fa
