### Using SnpEff

We will compare two strains of the Ebola virus and we will attempt to
determine which changes are likely to impact the function of the genome.

For all annotation tools from the very beginning  we need to know
which genome is the annotation database using
and we need to align against the same genome.

	# Find what databases are present.
	snpEff databases > listing.txt

	# Find the information on ebola
	grep ebola listing.txt

	# Produces the output:
	# ebola_zaire   Ebola Zaire Virus    KJ660346.1   OK
	# http://downloads.sourceforge.net/project/snpeff/databases/v4_1/snpEff_v4_1_ebola_zaire.zip

Note the version number of the accession number `KJ660346.1` the actual version number
may be higher. It is typically the best idea is to use the exact versions even if a newer
one is available.

	# Make the directory to store the reference in
	mkdir -p ~/refs/ebola

	# Now snpEff is built with one specific genomic build.
	# We need to align agains this genomic build.
	#
	# We also need to rename the sequence name to match that from snpEFF
	#
	REF=~/refs/ebola/KJ660346.fa
	efetch -db nucleotide -id KJ660346.1 -format fasta | seqret -filter -sid KJ660346 > $REF

	# Index the sequence.
	bwa index $REF
	samtools faidx $REF

	# Get data from an ebola sequencing run.
	fastq-dump -X 20000 --split-files SRR1553425

	# Bam conversion and sorting shortcut.
	alias bam='samtools view -b - | samtools sort -o - booyah'

	# Align the data.
	TAG='@RG\tID:1\tSM:SRR1553425\tLB:1'
	bwa mem -R $TAG $REF SRR1553425_1.fastq SRR1553425_2.fastq | bam > results.bam; samtools index results.bam

	# Call the snps.
	freebayes --use-mapping-quality -p 1 -f $REF results.bam > results.vcf

	# Annotate the snps.
	snpEff ebola_zaire results.vcf > annotated_results.vcf

To also view the annotations themselves we need to download the reference as GenBank and
transform that to an interval format:

	# Transforms GenBank to GFF3
	efetch -db nucleotide -id KJ660346.1 -format gb | seqret -filter -feature -osformat gff > ebola.gff

	# The file above contains all features. To keep only CDS (coding sequences)
	cat ebola.gff | awk ' $3 == "CDS" { print $0 } ' > ebola_coding.gff

The resulting outputs can be viewed in IGV

<img src="/tools/snpeff/img/snpeff-annotation.png" class="img-responsive">

Or as an HTML report with several entries. For example "Codon changes"":

<img src="/tools/snpeff/img/snpeff-report.png" class="img-responsive">