#  What is the the flag code for
#
#    - a paired end read
#    - in proper pairing
#    - aligned to the reverse strand
#    - with a read mate that also aligns to the reverse strand
#
samtools flags PAIRED,PROPER_PAIR,REVERSE,MREVERSE
#
# 0x33    51    PAIRED,PROPER_PAIR,REVERSE,MREVERSE
#
# It works for numbers too.
#
samtools flags 51
#
# 0x33	51	PAIRED,PROPER_PAIR,REVERSE,MREVERSE
#