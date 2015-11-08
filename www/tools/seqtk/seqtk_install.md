## Seqtk

Seqtk is a fast and lightweight tool for processing sequences in the FASTA or
FASTQ format. It seamlessly parses both FASTA and FASTQ files which can also be
optionally compressed by gzip.

Webpage: https://github.com/lh3/seqtk

**Mac OS X**

    brew update
    brew info seqtk
    brew install seqtk

**All Platforms**:

    cd ~/src
    git clone https://github.com/lh3/seqtk.git
    cd seqtk
    make

    # Link the program to your bin folder
    ln -s ~/src/seqtk/seqtk ~/bin/seqtk

A nicely formatted manual can be accessed via:

    more ~/src/seqtk/README.md

Test installation by running:

    seqtk