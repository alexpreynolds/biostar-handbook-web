# Where is the prefetch command?
which prefetch

# The prefetch command download files from the remote site.
# Look the help for the file.
prefetch -h

# Now let's obtain one file. We got the run number SRR from the webpage above
prefetch SRR1553610

# Where did that data go?
# Once saved locally accessing this data won't need to connect to the internet.
ls ~/ncbi/public/sra/

# You need to prefetch only if you plan to access the same data in different contexts.
# SRA format typically takes less space than other formats.

# We can generate a FASTQ file from the SRA file the fastq-dump program.
fastq-dump -h

# Unpack the file. You need the --split-files flag.
fastq-dump --split-files SRR1553610

# Generate a quality report of these files
fastqc *.fastq

# Data could be very large. We can also download subsets of it.
fastq-dump -X 15000 --split-files SRR1553610

# How to download multiple files?
# Create a file that contains SRR runs.
# You can create this with an editor as well. One run id per line.
echo SRR1553608 > sra_ids.txt
echo SRR1553605 >> sra_ids.txt

# Use this file to prefetch the runs.
prefetch --option-file sra_ids.txt

# Unpack all the downloaded files.
# You could list all files with ~/ncbi/public/sra/*.sra or be explicit about the files
# Why doesn't the fastq-dump command take a sra_ids.txt file? Not sure but it does not seem so.
fastq-dump --split-files ~/ncbi/public/sra/SRR1553608.sra ~/ncbi/public/sra/SRR1553605.sra

# You could also dump all downloaded data from the prefetch directory like so.
fastq-dump --split-files ~/ncbi/public/sra/*.sra

#
# Optional step:
#
# There are of course various workarounds that require some programming.
# We could use the sed (streamline editor) tool to replace the
# pattern SRR (the start of each id) with the entire command to to extract the file.
# Then push that each into execution via bash

# See what this does.
cat sra_ids.txt | sed 's/SRR/fastq-dump --split-files SRR/'

# Now pass the output of it into a bash process to be run.
cat sra_ids.txt | sed 's/SRR/fastq-dump --split-files SRR/' | bash