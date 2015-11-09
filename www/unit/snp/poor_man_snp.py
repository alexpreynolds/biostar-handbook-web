import sys
# Assumes that matching characters have already been removed
# by piping pileup output through 'tr -d '$^],.'
DEPTH = 10

print "##fileformat=VCFv4.0"
print "\t".join("#CHROM POS ID REF ALT QUAL FILTER INFO FORMAT SAMPLE".split())

for line in sys.stdin:
    chrom, pos, ref, depth, reads, qual = line.split("\t")
    rlen = len(reads)
    if rlen > 10:
        depth = int(depth)

        # Heterozygote has at least 30% of depth called as ref
        if (depth-rlen) > 5:
            gt = "0/1"
        else:
            gt = "1/1"

        alt = ""
        for base in "ATGC":
            count = reads.count(base)
            if count > 5:
                alt = base

        if alt:
            out = [ chrom, pos, ".", ref, alt, ".", "PASS", ".", "GT", gt]
            print "\t".join(out)