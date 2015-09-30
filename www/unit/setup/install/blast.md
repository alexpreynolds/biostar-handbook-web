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
	curl -O  ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.2.31+-universal-macosx.tar.gz
	tar zxvf ncbi-blast-2.2.31+-universal-macosx.tar.gz
	export PATH=~/src/ncbi-blast-2.2.31+/bin:$PATH
	
	# See the programs that are available
	ls ~/src/ncbi-blast-2.2.31+/bin/
	
	
**Windows/Cygwin**:

	cd ~/src
	curl -O  ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.2.31+-win64.exe
	# Run the installer.
	~/src/ncbi-blast-2.2.31+-win64.exe
	export PATH=~/src/ncbi-blast-2.2.31+/bin:$PATH
	
	# See the programs that are available
	ls ~/src/ncbi-blast-2.2.31+/bin/
	
Test installation by running:

    blastn -version
    
[web-blast]: http://blast.ncbi.nlm.nih.gov/Blast.cgi
[local-blast]: ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/