#
# The sequences THISLINE, ISALIGN are a cute aligment example borrowed from
# Market Zvelebil, Jeremy Baum: Understanding Bioinformatics ISBN:978-0815340249
#
# Local alignments.
local-align.sh THISLINE ISALIGNED

# Override the gap open penalty.
local-align.sh THISLINE ISALIGNED -gapopen 1

# Output formats: pair, msf, markx0, markx1, markx2 ...
local-align.sh THISLINE ISALIGNED -gapopen 1 -aformat msf

# Global alignment. Remove comment lines from output.
global-align.sh THISLINE ISALIGNED | grep -v '#'

# Override the gap open and gap extension penalty.
global-align.sh THISLINE ISALIGNED -gapopen 2 -gapextend 1

# Download different scoring matrices
# ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/

# This matrix is the "standard" EDNAFULL substitution matrix.
curl -O ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/NUC.4.4

# Get the BLOSUM30, BLOSUM62, and BLOSUM90 matrices.
curl -O ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/BLOSUM30
curl -O ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/BLOSUM62
curl -O ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/BLOSUM90

# Default alignment uses the BLOSUM62 substitution matrix.
local-align.sh THISLINE ISALIGNED | grep -v "#"

# Aligning with the BLOSUM30 substitution matrix.
local-align.sh THISLINE ISALIGNED -data BLOSUM30 | grep -v "#"

# Aligning with the BLOSUM62 substitution matrix.
local-align.sh THISLINE ISALIGNED -data BLOSUM90 | grep -v "#"

# Compare the substitution scores for Alanine.
cat BLOSUM30 BLOSUM62 BLOSUM90 | egrep '^A'

# Realistic scenario.
