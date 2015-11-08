## BLAST

BLAST stands for **Basic Local Alignment Search Tool**
and is an algorithm for searching a sequence (called a query)
against very large sequence databases (called a target).

NCBI has is a [web interface][web-blast] for BLAST and provides
[downloadable blast][local-blast] programs.

> Note: The blast version may change in time. The name of
> the file indicates the version of the program.
> Investigate the version of the [latest release][local-blast]
> and adapt the names of the programs accordingly.
> These instructions will install version `BLAST+ 2.2.31`

**Mac OSX**:

	brew update
	brew info blast
	brew install blast
	
	
Alternatively one may install the binaries 

    cd ~/src
    curl -O  ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.2.31+-universal-macosx.tar.gz
    tar zxvf ncbi-blast-2.2.31+-universal-macosx.tar.gz
    export PATH=~/src/ncbi-blast-2.2.31+/bin:$PATH

**Linux**:

    cd ~/src
    curl -O  ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.2.31+-x64-linux.tar.gz
    tar zxvf ncbi-blast-2.2.31+-x64-linux.tar.gz
    export PATH=~/src/ncbi-blast-2.2.31+/bin:$PATH

    # See the programs that are available
    ls ~/src/ncbi-blast-2.2.31+/bin/


**Windows**:

Blast can be easily installed on Windows system.

* Visit [ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/](ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/)
* Download the file `ncbi-blast-2.2.31+-win64.exe`
* Double-click and install

**Note** that installing into the default path can make 
blast fail in some circumstances because this path includes 
a directory named `Program Files` and the space in the name of the 
directory can cause various problems later. 
It is best if the installation is performed into the cygwin directory:

    C:\cygwin64\home\your-user-name\src\
    
New Cygwin terminals will be able to run all blast tools.
	
Test installation by running:

    which blastn
    blastn -version
    


[web-blast]: http://blast.ncbi.nlm.nih.gov/Blast.cgi
[local-blast]: ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/