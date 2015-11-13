Data preparation for human data related examples. This only needs to be done once.

	# Create the reference genome directory for Homo Sapiens.
	mkdir -p ~/refs/hs

	# Download human mitochondrial genome.
	# Rename the sequence id and sequence file name for easier access.
	efetch -id NC_012920.1 -db nuccore -format fasta | seqret -filter -sid NC_012920v1 > ~/refs/hs/mitoc.fa

	# Set up the reference variable.
	REF=~/refs/hs/mitoc.fa

	# Generate indices to the data.
	samtools faidx $REF
    picard CreateSequenceDictionary REFERENCE=$REF OUTPUT=~/refs/hs/mitoc.dict

	# index the genome
	bwa index $REF