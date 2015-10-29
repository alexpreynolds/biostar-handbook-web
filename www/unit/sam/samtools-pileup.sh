# Pileup without a reference
samtools mpileup results.bam | head

# Pileup with a reference file.
samtools mpileup -f $REF results.bam | head

# Pileups can take locations
samtools mpileup -f $REF results.bam -r KM034562v1:1,540-1,550

# Poor man's SNP caller
samtools mpileup -f $REF results.bam | tr -d '$^],.' | awk -F '\t' ' length($5)>5 { print $0 }'

