
Download the 1976 and 2014 strains of the Ebola virus.
This only needs to be done once.

	# Create the reference genome directory.
	mkdir -p ~/ref/ebola

	# Download the genomes.
	# We rewrite the sequence names to be simpler to type.
	#
	# gi|10141003|gb|AF086833.2| --> AF086833v2
	# gi|661348725|gb|KM034562.1| --> KM034562v1
	#
	efetch -db=nuccore -format=fasta -id=AF086833.2 | seqret -filter -sid AF086833v2 > ~/refs/ebola/1976.fa
	efetch -db=nuccore -format=fasta -id=KM034562.1 | seqret -filter -sid KM034562v1 > ~/refs/ebola/2014.fa

