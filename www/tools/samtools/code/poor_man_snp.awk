# The poor man's snp caller can generate a BED file
# Assumes that matching characters have already been removed
# by piping pileup output through 'tr -d '$^],.'
BEGIN {
	FS="\t"; OFS="\t"; DEPTH = 10;
}

length($5) > DEPTH {
	print $1, $2-1, $2
}