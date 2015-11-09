
Investigate the pileups

	# Generate and align data.
	generate_experimental_data; align_experimental_data

	# Pileup without a reference.
	samtools mpileup experiment.bam | head
	#
	# [mpileup] 1 samples in 1 input files
	# <mpileup> Set max per-file depth to 8000
	# KM034562v1	 7	N	1	^]C	2
	# KM034562v1	 8	N	1	A	4
	# KM034562v1	 9	N	1	C	1

	# Pileup with a reference file.
	samtools mpileup -f $REF experiment.bam | head
	#
	# [mpileup] 1 samples in 1 input files
	# <mpileup> Set max per-file depth to 8000
	# KM034562v1	 7	C	1	^].	2
	# KM034562v1	 8	A	1	.	4
	# KM034562v1	 9	C	1	.	1

	# Pileups can take location coordinates
	samtools mpileup -f $REF experiment.bam -r KM034562v1:1,000-1,003
	#
	# [mpileup] 1 samples in 1 input files
	# <mpileup> Set max per-file depth to 8000
	# KM034562v1	1000	A	36	,$.,...,.,,,...,,..,,.....,,,.,t,,..,	34302222142523242232...
	# KM034562v1	1001	G	37	.$,...,.,,,...,,..,,..C..,,.,,,,..,^].^].^],	051124233273...
	# KM034562v1	1002	T	37	,...,.,,,...,,..,,.....,,,.,,,,..,..,	12/33223262324262242...
	# KM034562v1	1003	A	38	,...,.,,,...,,..,,.....,,,.,,,,..,..,^],	0525144222322023...

	# Pileups can take SAM flags in the --rf (required flag) or --ff (filtering flag)
	#
	# Pileup from reads on reverse strand.
	samtools mpileup --rf 16 -f $REF experiment.bam -r KM034562v1:1,000-1,003
	#
	# [mpileup] 1 samples in 1 input files
	# <mpileup> Set max per-file depth to 8000
	# KM034562v1	1000	A	18	,$,,,,,,,,,,,,,t,,,	33214224322020.2/2
	# KM034562v1	1001	G	17	,,,,,,,,,,,,,,,,^],	54332242352433343
	# KM034562v1	1002	T	18	,,,,,,,,,,,,,,,,,,	1323224220622472/5
	# KM034562v1	1003	A	19	,,,,,,,,,,,,,,,,,,^],	0142220532214222302

	# Pileup from reads on the forward strand.
	samtools mpileup --ff 16 -f $REF experiment.bam -r KM034562v1:1,000-1,003
	# [mpileup] 1 samples in 1 input files
	# <mpileup> Set max per-file depth to 8000
	# KM034562v1	1000	A	18	..................	402225232212222224
	# KM034562v1	1001	G	20	.$...........C.....^].^].	01122734523234225134
	# KM034562v1	1002	T	19	...................	2/32623264210112212
	# KM034562v1	1003	A	19	...................	5254232233622201223

	# A Poor man's SNP caller.
	# SNP calling with simple one-liner.
	samtools mpileup -f $REF experiment.bam | tr -d '$^],.' | awk -F '\t' 'length($5)>5 { print $0 }'

	# The poor man's snp caller can generate a BED file
	# that can be visualized in IGV.
	samtools mpileup -f $REF experiment.bam | tr -d '$^],.' | awk -F '\t' 'length($5)>5 { OFS="\t";  print $1, $2-1, $2 }'  > snps.bed

	# Building a command line alias from an awk script gets messy.
	# Both bash and awk will want to execute the variables denoted with the $ sign.
	# Best if we put the code into a separate file.
	echo 'BEGIN { FS="\t"; OFS="\t" } length($5)>5 { OFS="\t";  print $1, $2-1, $2 }' > snpcaller.awk

	alias poor_mans_snp="samtools mpileup -f $REF experiment.bam | tr -d '$^],.' | awk -f snpcaller.awk > snps.bed"

	# make that into a megaton command.
	alias megaton='generate_experimental_data; align_experimental_data; poor_mans_snp;'
