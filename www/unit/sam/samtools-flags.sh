samtools flags PAIRED,PROPER_PAIR,REVERSE,MREVERSE
#
# The incantation above tells us that the flag code for
# a paired read in proper pairing aligned to the reverse strand
# when the read mate is also mapping to the reverse strand
# will be flag=51.
#
# 0x33    51    PAIRED,PROPER_PAIR,REVERSE,MREVERSE
#