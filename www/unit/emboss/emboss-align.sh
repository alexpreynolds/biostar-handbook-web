#
# Cute aligment example borrowed from
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

# Override the gap open penalty.
global-align.sh THISLINE ISALIGNED -gapopen 1 | grep -v '#'

