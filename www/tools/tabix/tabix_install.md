## Tabix

Tabix indexes a TAB-delimited genome position file in.tab.bgz and creates an
index file ( in.tab.bgz.tbi or in.tab.bgz.csi ) when region is absent from the command-line.
The input data file must be position sorted and compressed by bgzip which has a gzip(1)
like interface. After indexing, tabix is able to quickly retrieve data lines overlapping
regions specified in the format "chr:beginPos-endPos". Fast data retrieval also works over
network if URI is given as a file name and in this case the index file will be downloaded
if it is not present locally.

Tabix is used with the bgzip compression format (a variant of gzip with a so called block compression).
You can uncompress bgzip with gzip but not viceversa.

Webpage: http://www.htslib.org/doc/tabix.html

Publication: [Tabix: fast retrieval of sequence features from generic TAB-delimited files, Bioinformatics, 2010][tabix-pub]

[tabix-pub]: http://bioinformatics.oxfordjournals.org/content/27/5/718.full

Using tabix

    # Get a GFF3 file from SGD
    curl -L http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff > data.gff

    # Data preparation. Needs to be done only once.
    # The file needs to be sorted by coordinates.
    # We also need to retain only the coordinate sections (this GFF contains sequence at the end)
    # The number of fields NF is 9 for all GFF records.
    # Then sort by chromosome and start coordinate. Finally compress output via bgzip
    cat data.gff | awk -F '\t'  ' NF==9 { print $0 } ' | sort -k1,1 -k4,4n | bgzip -c >  sgd.gff.gz

    # The sgd.gff.gz file is the one we keep and store.

    # Build index off of the gff file.
    tabix -p gff sgd.gff.gz

    # Query the gff file.
    tabix sgd.gff.gz chrV:1-100

**Mac OSX**:

	brew update
	brew info tabix
	brew install tabix

**Source code installation: Mac OSX, Linux, Cygwin/Windows**

    cd ~/src
    curl -OL https://github.com/samtools/htslib/releases/download/1.2.1/htslib-1.2.1.tar.bz2
    tar zxvf htslib-1.2.1.tar.bz2
    cd ~/src/htslib-1.2.1
    ./configure
    make

    # Link the program to your bin folder
    ln -s ~/src/htslib-1.2.1/tabix ~/bin/tabix
    ln -s ~/src/htslib-1.2.1/bgzip ~/bin/bgzip

Test installation by running:

    tabix