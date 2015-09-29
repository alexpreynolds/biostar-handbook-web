## EMBOSS

EMBOSS is **The European Molecular Biology Open Software Suite**
an open source software analysis package specially developed for the needs
of the molecular biology. EMBOSS offers programs covering areas such as:

* Sequence alignment
* Rapid database searching with sequence patterns
* Protein motif identification, including domain analysis
* Nucleotide sequence pattern analysis: for example to identify CpG islands or repeats
* Codon usage analysis for small genomes
* Rapid identification of sequence patterns in large scale sequence sets

Web: http://emboss.sourceforge.net/

Publication: [EMBOSS: The European Molecular Biology Open Software Suite (2000) Rice,P. Longden,I. and Bleasby,A.
Trends in Genetics 16][emboss]

[emboss]: http://www.ncbi.nlm.nih.gov/pubmed/10827456

**Mac OSX**:

    brew update
    brew info emboss
    
    # You need to install a dependency called X11.
    # The command may take 
    # quite a bit of time. It will also require a password as well.
    brew install Caskroom/cask/xquartz
    
    # Install the EMBOSS package.
    brew install emboss
    
    # Advanced installation 
    # brew install libharu gd
    # brew install emboss --with-gd --with-libharu

**Linux (Ubuntu)**:

    sudo apt-get install emboss

**Windows/Cygwin)**:

    # test the download procedure

Test installation by running:

    needle -h