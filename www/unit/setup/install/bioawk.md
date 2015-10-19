## Bioawk

Bioawk is an extension to Brian Kernighan's awk, adding the support of several
common biological data formats, including optionally gzip'ed BED, GFF, SAM, VCF,
FASTA/Q and TAB-delimited formats with column names. It also adds a few built-in
functions and an command line option to use TAB as the input/output delimiter.
When the new functionality is not used, bioawk is intended to behave exactly the
same as the original BWK awk.

Webpage: https://github.com/lh3/bioawk

**Mac OS X**

    brew update
    brew info bioawk
    brew install bioawk

**Source install for all platforms**:

    cd ~/src
    git clone https://github.com/lh3/bioawk.git
    cd bioawk
    make

    # Link the program to your bin folder
    ln -s ~/src/bioawk/bioawk ~/bin/bioawk

A nicely formatted manual can be accessed via:

    man ~/src/bioawk/awk.1

The Bioawk specific extensions are described towards the end of the
manual page. Test installation by running:

    bioawk



