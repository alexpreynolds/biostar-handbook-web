# How to call bedtools intersect

# output an interval from a every time it intersects an interval in b
bedtools intersect -a intervals1.bed -b genes.bed

# output only unique intervals from a
bedtools intersect -a intervals1.bed -b genes.bed -u

# output only unique intervals from a that overlap b on the same strand
bedtools intersect -a intervals1.bed -b genes.bed -s -u

# output only unique intervals from a that overlap b on the opposite strand
bedtools intersect -a intervals1.bed -b genes.bed -S -u

# output intervals from a that don't overlap any intervals in b
bedtools intersect -a intervals1.bed -b genes.bed -v

# count the number of intervals overlapping each gene
bedtools intersect -a genes.bed -b intervals1.bed -c
