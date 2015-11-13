# How to call bedtools closest

# find the closest genes in b to our peaks in a
bedtools closest -a peaks.bed -b genes.bed

# report the distance between the peaks and closest genes
bedtools closest -a peaks.bed -b genes.bed -d

# report the closest downstream genes to peaks in a along with the distance
bedtools closest -a peaks.bed -b genes.bed -iu -D ref

# report the closest upstream genes to peaks in a along with distance
bedtools closest -a peaks.bed -b genes.bed -id -D ref

# note that if there is no gene upstream of our peak it will not report
# anything if we tell it to ignore downstream genes 
