## Bowtie 1 and 2

Bowtie is an ultrafast, memory-efficient short read aligner. It aligns short DNA sequences (reads) to the human genome at a rate of over 25 million 35-bp reads per hour. Bowtie indexes the genome with a Burrows-Wheeler index to keep its memory footprint small: typically about 2.2 GB for the human genome (2.9 GB for paired-end).

It has two versions:

* [Bowtie 1][bowtie1] - first version that is trades accuracy for speed. The aligner cannot handle indels (insertions and deletions) hence it is best for a subset of problems where that is not a problem. For example Bowtie 1 is the tool of choice for mapping microRNAs.
* [Bowtie 2][bowtie2] - slower than Bowtie 1 but implements a more accurate and rigorous alignment procedure.

[bowtie1]: http://bowtie-bio.sourceforge.net/index.shtml
[bowtie2]: http://bowtie-bio.sourceforge.net/bowtie2/index.shtml

Publications:

* Bowtie1: [Ultrafast and memory-efficient alignment of short DNA sequences to the human genome, Genome Biology, 2009][bowtie1-paper]
* Bowtie2: [Fast gapped-read alignment with Bowtie 2. Nature Methods. 2012][bowtie2-paper]

[bowtie1-paper]: http://www.genomebiology.com/2009/10/3/R25
[bowtie2-paper]: http://www.nature.com/nmeth/journal/v9/n4/full/nmeth.1923.html

To avoid confusion it is best if you install only one version: `bowtie2`. There are substantial differences in the way we invoke and run these commands.
If you need `bowtie1` installed you will need to slightly adapt the installation commands.

**Mac OSX**:

	brew update
	brew info bowtie2
	brew install bowtie2
	
**Mac OSX alternative**

	cd ~/src	
	curl -OL http://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.6/bowtie2-2.2.6-macos-x86_64.zip
	unzip bowtie2-2.2.6-macos-x86_64.zip
	export PATH=~/src/bowtie2-2.2.6:$PATH
	
**Linux**

	cd ~/src	
	curl -OL http://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.6/bowtie2-2.2.6-linux-x86_64.zip
	unzip bowtie2-2.2.6-linux-x86_64.zip
	export PATH=~/src/bowtie2-2.2.6:$PATH
	
**Cygwin/Windows**
	
	cd ~/src	
	curl -OL http://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.6/bowtie2-2.2.6-mingw-win64.zip
	unzip bowtie2-2.2.6-mingw-win64.zip
	export PATH=~/src/bowtie2-2.2.6:$PATH
	
Test installation by running:

    bowtie2