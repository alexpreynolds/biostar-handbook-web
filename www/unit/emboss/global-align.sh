#!/bin/bash
#
# Performs a local alignment on two sequences passed
# from the command line.
#
# global-align.sh ATCGA CTAGGA -gapopen 1
# global-align.sh ATCGA CTAGGA -gapopen 10
#

# Run in strict mode.
set -ue

# Brad Pedersen: https://www.biostars.org/p/100676/#100689
# Pass the remainder of the parameters at the with ${@:3}
needle <(echo -e ">a\n$1") <(echo -e ">a\n$2") "${@:3}" -filter

# Note: use the tool named: stretcher
# for a less rigorous but better performing algorithm.

