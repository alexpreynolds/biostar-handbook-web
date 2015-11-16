# Downloading annotations
#
# We will look to download:
#   1. A reference genome FASTA file
#   2. A reference transcriptome FASTA file
#   3. A reference transcript GFF3 file
#

# create appropriate directories
mkdir -p ./data/anno

# download reference genome
wget http://plasmodb.org/common/downloads/release-26/Pfalciparum3D7/fasta/data/PlasmoDB-26_Pfalciparum3D7_Genome.fasta -O tmp_genome.fasta

# download reference transcriptome
wget http://plasmodb.org/common/downloads/release-26/Pfalciparum3D7/fasta/data/PlasmoDB-26_Pfalciparum3D7_AnnotatedTranscripts.fasta -O tmp_transcriptome.fasta

# download reference annotations
wget http://plasmodb.org/common/downloads/release-26/Pfalciparum3D7/gff/data/PlasmoDB-26_Pfalciparum3D7.gff -O tmp.gff

## clean up files for ease of use

# remove suerpfluous fasta header information
cat ./data/anno/tmp_genome.fasta | awk '{if($0 ~ />/) {split($0, X, " "); print X[1]} else {print $0}}' > ./data/anno/pf3d7_genome.fasta
cat ./data/anno/tmp_transcriptome.fasta | awk '{if($0 ~ />/) {split($0, X, " "); print X[1]} else {print $0}}' > ./data/anno/pf3d7_transcriptome.fasta

# remove all entries except for exons, CDS, and mRNAs
cat ./data/anno/tmp.gff | awk '$3 == "exon" || $3 == "CDS" || $3 == "mRNA" {print $0}' > ./data/anno/pf3d7.gff

# remove temporary files
rm -rf tmp.*
