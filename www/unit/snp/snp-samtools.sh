REF=~/refs/ebola/2014.fa

# Sorts and converts a SAM file into a BAM file.
alias bam='samtools view -b - | samtools sort -o - booyah'

# These are our "experimental" measurements. We are generating them
# from the reference and by default the simulator will
# introduce sequencing errors and mutations.
alias generate_experimental_data='dwgsim -N 5000 $REF experiment'

# Align the "experimentally" produced reads against the reference.
# We have now set up the alias to pull information from
# other variables that we can change.
export TAG='@RG\tID:foo1\tSM:bar1\tLB:lib1'
export OUT='experiment1.bam'
alias align_experimental_data='bwa mem -R $TAG $REF experiment.bwa.read1.fastq experiment.bwa.read2.fastq | bam > $OUT; samtools index $OUT'

# We can use words to perform multiple actions.
generate_experimental_data; align_experimental_data

# Create the second sample.
export TAG='@RG\tID:foo2\tSM:bar2\tLB:lib2'
export OUT='experiment2.bam'
generate_experimental_data; align_experimental_data

# Create the third sample.
# Note that we are not generating a new data here!
# So the third sample comes from the same genome as the second.
export TAG='@RG\tID:foo3\tSM:bar3\tLB:lib3'
export OUT='experiment3.bam'

# Create the alignment for the third experiment.
align_experimental_data

# Verify that the alignment has indeed worked.
samtools view experiment1.bam | head -1

# View the pileup.
samtools mpileup -f $REF experiment1.bam | head

# Compute the genotype with samtools, typically we
# either have
samtools mpileup -uvf $REF experiment1.bam | head

# Investigate the BCF tools
bcftools call

# Pass the output of genotype likelihood computation
# into the SNP caller.
samtools mpileup -uvf $REF experiment1.bam experiment2.bam experiment3.bam | bcftools call -vm -O v > variants-samtools.vcf

# Call snps with freebayes (optional step).
freebayes -f $REF experiment1.bam experiment2.bam experiment3.bam > variants-freebayes.vcf

# Visualize the data in IGV