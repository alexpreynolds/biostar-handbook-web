# Pipeline to:
#   1. remove intervals we don't want
#   2. count number of overlaps between reads and intervals
#   3. apply normalization to the counts per interval

# Let's call intervals1.bed our reads file and genes.bed our feature file
# We want to get an idea of where our reads map

# are there any reads that don't overlap a gene?
bedtools intersect -a intervals1.bed -b genes.bed -v

# looks like it. let's remove those
bedtools intersect -a intervals1.bed -b genes.bed -u > reads.bed

# do any reads overlap more than one gene?
bedtools intersect -a reads.bed -b genes.bed -c

# looks like some of our genes overlap. let's only keep reads that
# overlap one gene to remove ambiguitity
bedtools intersect -a reads.bed -b genes.bed -c | awk '$7  == 1 {print $0}' > unique_reads.bed

# now lets calculate the number of reads per gene
bedtools intersect -a genes.bed -b unique_reads.bed -c > genes_count.bed

# let's normalize those counts by the length and number of mapped reads
# and multiply by a big number to make them easy to understand and
# comparable
total=$(awk '{sum += $7} END {print sum}' genes_count.bed)
cat genes_count.bed | awk -v total=$total '{print $1,$2,$3,$4,$5,$6,($7 / ($5 * total)) * 1000000}' > genes_norm_counts.bed

# let's compare another reads file, intervals2.bed with our intervals1.bed
# which file better matches our gene annotations?
# use the -s flag to only count reads on the same strand
bedtools jaccard -a intervals1.bed -b genes.bed -s
bedtools jaccard -a intervals2.bed -b genes.bed -s

# what if we merged the two interval files into one file and merged
# the intervals together and then checked if that was any better?
# bedtools merge can do this for us
# sort -k1,1 -k2,2n is necessary to sort by chromosome and start position
cat intervals1.bed intervals2.bed | sort -k1,1 -k2,2n | bedtools merge -i - | bedtools jaccard -a - -b genes.bed
