# NT is  the entire nucleotide database
# You could download multiple files by
# passing patterns into a url downloaded with curl
mkdir -p ~/refs/nt
curl -O ftp://ftp.ncbi.nlm.nih.gov/blast/db/nt.[00-39].tar.gz -o ~/refs/nt

# Since blast database downloads are so common
# the blast package includes an update script.
update_blastdb.pl --showall

# Download the nt database.
update_blastdb.pl nt


