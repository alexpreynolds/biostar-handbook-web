## Samtools

Samtools is a software for reading/writing/editing/indexing/viewing SAM/BAM/CRAM format

* Webpage: http://www.htslib.org/
* SAM documentation: http://www.htslib.org/doc/samtools.html
* SAM Specification: http://samtools.github.io/hts-specs/
* Publication: [The Sequence Alignment/Map format and SAMtools](http://www.ncbi.nlm.nih.gov/pubmed/19505943)

Learn more about the `CRAM` format:

* [CRAM goes mainline](http://genomeinformatician.blogspot.com/2014/08/cram-goes-mainline.html) by Ewan Birney 
  
  
**Mac OSX**:

	brew update
	brew info samtools
	brew install samtools
	
**Source code installation: Mac OSX, Linux, Cygwin/Windows**

    cd ~/src
    curl -OL https://github.com/samtools/samtools/releases/download/1.2/samtools-1.2.tar.bz2
    tar jxvf samtools-1.2.tar.bz2
    cd samtools-1.2
    make
    export PATH=~/src/samtools-1.2:$PATH

**Note for Cygwin/Windows**: before compiling samtools on Cygwin edit the `Makefile` and replace the 
lines marked by `-` with the lines indicated by `+`:

    -CFLAGS = -g -Wall -O2
    +CFLAGS = -g -Wall -O2 -lm
    
    -DFLAGS = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -D_CURSES_LIB=1
    +DFLAGS = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -D_CURSES_LIB=1 -Dlogl=log -Dexpl=exp
 
 
Test that the installation succeeded:
    
    samtools
    
Samtools has a nicely formatted manual:

    man ~/src/samtools-1.2/samtools.1 
    
A neat conversion shorcut for all of us 
wanting to be able to convert and sort 
in just one step:

    alias bam='samtools view -b - | samtools sort -o - booyah'

Now you can convert and sort in one step:

    cat example.sam | bam > sorted.bam

What's with the `booyah``? It is bioinformatics! A parameter
that is required to be there but not actually used in any way.

Rock on!
    
       
  