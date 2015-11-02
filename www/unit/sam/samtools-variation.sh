REF=~/refs/ebola/2014.fa
REAL=real.fa

#
# make a copy of your genome, 
# that you can also edit to introduce certain features into it
# generate data from this genome then map it back to the reference
#
alias reset='\cp -f $REF $REAL'

# Set up shortcuts to simulate mutated genomes.
alias bam='samtools view -b - | samtools sort -o - booyah'

# Simulate reads with no errors and mutations.
alias simulate='dwgsim -e 0 -E 0 -r 0 -R 0 -N 5000 $REAL experiment'

# Align the simulated reads and produce
alias align='bwa mem $REF experiment.bwa.read1.fastq experiment.bwa.read2.fastq | bam > experiment.bam; samtools index experiment.bam'

# Align the simulated genome against the original genome.
alias reality='bwa mem $REF $REAL | bam > real.bam; samtools index real.bam'

# Select reads that are not properly paired.
alias improper='samtools view -b -F 4 -F 2  experiment.bam > improper.bam; samtools index improper.bam'

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
# 3. Aligns the high throughput data against the reference.
#
# 4. Selects improperly pairedreads into a different file.
#
# That's a megaton!
alias megaton='reality; simulate; align; improper'

# Simulate a megaton worth of information
# View the results in IGV
reset
megaton

#
# Among the most difficult tasks are those that
# require reverse engineering what we have from what we see
# when we compare reality to the reference.
# 
# Example: a sequence duplication event appends
# 1000 bases from the beginning of the genome
# to the end of it. Can you observe this from the alignments?
reset
cat $REF | seqret -filter -sbegin 1 -send 1000 -osformat text >> $REAL
megaton


# Another event adds the same 549 bases
# but it reverse complements it before attaching
# it to the end. Can we recognize this event from the short read
# alignments?
reset
cat $REF | seqret -filter -sbegin 1 -send 1000 -srev -osformat text >> $REAL
megaton

# Cut a 1KB sequence reverse complement it
# add it back into the same place.
reset
cat $REF | seqret -filter -sbegin 5000 -send 6000 -srev > chunk.fa
cat $REF | cutseq -filter -from 5000 -to 6000 > cut.fa
pasteseq -filter cut.fa chunk.fa -pos 5000 > $REAL
megaton



