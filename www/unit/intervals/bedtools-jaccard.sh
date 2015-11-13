# Quantify the similarity between two sets of intervals

# what do our intervals look like?
cat intervals1.bed | head

# what about our second pair of intervals? Can we already see a difference?
cat intervals2.bed | head

# let's calculate how different they are
bedtools jaccard -a intervals1.bed -b intervals.bed

# The statistic represents the first column divided by the second column.
# To understand in more detail what's happening please see the documentation.
