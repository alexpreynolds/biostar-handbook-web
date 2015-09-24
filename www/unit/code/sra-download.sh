#
# This script downloads data from the an SRA Bioproject.
# and runs FastQC quality reports the first 10 data sets that it obtains.
#
# Required script parameter is an SRA BioProject ID.
#
# It produces fastq files and fastqc reports.
#
# For example PRJNA257197

# First parameter is the run id.
PROJECT_ID=$1

# How many datasets to download.
LIMIT=3

# This variable is used internally to store the run ids.
SRA_IDS=sraids.txt

# Run the script with strict settings to immediately stop on errors.
set -ue

# Remind the user what is going on.
echo "Downloading from BioProject=$PROJECT_ID"

# Depending on the project this step may take a bit. If you need to rerun for same
# bioproject you may comment it out.
esearch -db sra -query $PROJECT_ID  | efetch -format runinfo > runinfo.txt

# Select 3 runs from Aug 19, 2014 and cut out the SRR run ids only.
cat runinfo.txt | cut -f 1 -d ',' | grep SRR | head -$LIMIT > $SRA_IDS

#
# Get data for each id in the file then run fastqc on it.
#
# This below works but for a more comprhensive solution see
# http://stackoverflow.com/questions/10929453/bash-scripting-read-file-line-by-line
#
while read -r LINE; do

    # We will only take the first 15000 reads because it is a demonstration.
    fastq-dump -X 15000 --split-files $LINE

    # Run fastqc on each dataset.
    fastqc ${LINE}_1.fastq ${LINE}_2.fastq

done < $SRA_IDS
