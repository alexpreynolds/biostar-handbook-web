# The prefetch command downloads files
# from the remote site.
prefetch -h

# Now let's obtain one file.
# We got the run number SRR from the
# Ebola Bioproject site.
prefetch SRR1553610

# Once saved locally accessing this data
# won't need to connect to the internet.
# Where did that data go?
ls ~/ncbi/public/sra/

# You need to prefetch only if you plan to
# access the same data in different contexts.
# SRA format typically takes less space
# than other formats.

# We can generate a FASTQ file from the SRA
# file the fastq-dump program.
# If the file has not yet been downloaded with prefetch
# fastq-dump will connect to the remote site.
fastq-dump -h

# The --split-files flag
# is required to restore to original configuration.
fastq-dump --split-files SRR1553610

# Generate a quality report of these files.
fastqc *.fastq

# We can also download subset of the data.
fastq-dump -X 15000 --split-files SRR1553610

# How to download multiple files?
# Create a file that contains SRR runs.
# You can create this with an editor as well. One run id per line.
echo SRR1553608 > sra.txt
echo SRR1553605 >> sra.txt

# Use this file to prefetch the runs.
prefetch --option-file sra.txt

# You could now dump all downloaded data
# from the prefetch directory like so.
fastq-dump --split-files ~/ncbi/public/sra/*.sra

# Or we could use the xargs command to
# construct and execute new commands

# This will echo the commands.
cat sra.txt | xargs -n 1 echo fastq-dump -X 15000 --split-files

# This will execute the commands.
cat sra.txt | xargs -n 1 fastq-dump -X 15000 --split-files