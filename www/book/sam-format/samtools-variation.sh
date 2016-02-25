#
# There is a process of "reverse engineering" when we
# generate alignments of data obtained from a real genome
# against the "illusion" of the reference genome.
#
REF=~/refs/ebola/2014.fa
REAL=real.fa

# Start with a copy of the reference genome.
alias reset='\cp -f $REF $REAL'

# Sorts and converts a SAM file into a BAM file.
alias bam='samtools view -b - | samtools sort -o - booyah'

# Align the real genome against the reference genome.
alias align_real_genome='bwa mem $REF $REAL | bam > real.bam; samtools index real.bam'

# Simulate reads from the real genome with no errors or mutations.
# These are our "experimental" measurements.
alias generate_experimental_data='dwgsim -e 0 -E 0 -r 0 -R 0 -N 5000 $REAL experiment'

# Align the "experimentally" produced reads against the reference.
alias align_experimental_data='bwa mem $REF experiment.bwa.read1.fastq experiment.bwa.read2.fastq | bam > experiment.bam; samtools index experiment.bam'

# Select reads that are not properly paired.
alias select_improper_pairs='samtools view -b -F 4 -F 2  experiment.bam > improper.bam; samtools index improper.bam'

# Run all steps in just one command.
# Invoked after modifying the real genome to contain changes relative to the
# reference.
#
# 1. Aligns the real genome against the reference.
#    Keep in mind that typically we don't know what the real genome is
#    We use it here just to see what a whole genome alignment looks like.
#
# 2. Simulate data from the real genome. This is what comes out of
#    a sequencing instrument.
#
# 3. Align the high throughput data against the reference.
#
# 4. Select and store improperly paired reads in a different file.
#
# That's a megaton!
alias megaton='align_real_genome; generate_experimental_data; align_experimental_data; select_improper_pairs'

# Simulate a megaton worth of information
# View the results in IGV
reset
megaton


# Example: a sequence duplication event appends
# 1000 bases from the beginning of the genome
# to the end of it.
#
# Can you observe this from the alignments?
#
reset
cat $REF | seqret -filter -sbegin 1 -send 1000 -osformat text >> $REAL
megaton

# Add the same 1000 bases but reverse
# complement them before appending them to the end.
reset
cat $REF | seqret -filter -sbegin 1 -send 1000 -srev -osformat text >> $REAL
megaton

# Cut a 1KB sequence from inside a sequence reverse
# complement it then add it back into the same place.
reset
# This is the reverse complemented sequence.
cat $REF | seqret -filter -sbegin 5000 -send 6000 -srev > chunk.fa
# This is the cut sequence.
cat $REF | cutseq -filter -from 5000 -to 6000 > cut.fa
# Paste it back into the same place.
pasteseq -filter cut.fa chunk.fa -pos 5000 > $REAL
megaton



