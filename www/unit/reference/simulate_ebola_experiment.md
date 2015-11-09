Set up the shortcuts to simulate data from the 2014 strain:

	REF=~/refs/ebola/2014.fa

	# Sorts and converts a SAM file into a BAM file.
	alias bam='samtools view -b - | samtools sort -o - booyah'

	# These are our "experimental" measurements. We are generating them
	# from the reference and by default the simulator will
	# introduce sequencing errors and mutations.
	alias generate_experimental_data='dwgsim -N 5000 $REF experiment'

	# Align the "experimentally" produced reads against the reference.
	# The result of this command is the file called 'experiment.bam' a sorted
	# and indexed bam file. obtained from the data produced by the command above it.
	alias align_experimental_data='bwa mem $REF experiment.bwa.read1.fastq experiment.bwa.read2.fastq | bam > experiment.bam; samtools index experiment.bam'
