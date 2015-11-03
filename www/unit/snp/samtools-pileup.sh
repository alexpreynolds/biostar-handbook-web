REF=~/refs/ebola/2014.fa

# Sorts and converts a SAM file into a BAM file.
alias bam='samtools view -b - | samtools sort -o - booyah'

# These are our "experimental" measurements. We are generating them
# from the reference and by default the simulator will
# introduce sequencing errors and mutations.
alias generate_experimental_data='dwgsim -N 5000 $REF experiment'

# Align the "experimentally" produced reads against the reference.
alias align_experimental_data='bwa mem $REF experiment.bwa.read1.fastq experiment.bwa.read2.fastq | bam > experiment.bam; samtools index experiment.bam'

# We can use words to perform multiple actions.
generate_experimental_data; align_experimental_data

# Pileup without a reference.
samtools mpileup experiment.bam | head

# Pileup with a reference file.
samtools mpileup -f $REF experiment.bam | head

# Pileups can take location coordinates
samtools mpileup -f $REF experiment.bam -r KM034562v1:1,000-1,010

# Pileup can take SAM flags in the --rf (required flag) or --ff (filtering flag)
#
# Pileup from reads on reverse strand.
samtools mpileup --rf 16 -f $REF experiment.bam -r KM034562v1:1,000-1,010

# Pileup from reads on the forward strand.
samtools mpileup --ff 16 -f $REF experiment.bam -r KM034562v1:1,000-1,010

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
