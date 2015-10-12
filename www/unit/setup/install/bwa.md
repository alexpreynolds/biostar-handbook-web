## BWA

BWA stands for **Burrows-Wheeler Aligner** and
is a software package for mapping low-divergent sequences against a
large reference genome, such as the human genome. It consists of three
algorithms:

* BWA-backtrack
* BWA-SW
* BWA-MEM.

**BWA-MEM** (Maximally Exact Matches), which is the latest, is generally recommended for high-quality
queries as it is faster and more accurate. BWA-MEM also has better
performance than BWA-backtrack for 70-100bp Illumina reads.

BWA is one of the most used high throughput aligners in the world yet it is "unpublished" and
by the classic standards of science is "non-peer reviewed". It is an interesting example with an [enlightening back story][bwa-mem-story]
of how the scientific peer review model can fail. 
The "unpublished" writeup on bwa-mem can be read on arxiv: [Aligning sequence reads, clone sequences and assembly contigs with BWA-MEM][bwa-mem-paper]

[bwa-mem-story]: https://gist.github.com/ialbert/3164967c853b7fd8f44e
[bwa-mem-paper]: http://arxiv.org/abs/1303.3997


**Mac OSX**:

	brew update
	brew info bwa
	brew install bwa

**Mac OSX, Linux and Cygwin/Windows**:

	cd ~/src
	curl -OL http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.12.tar.bz2
	tar jxvf bwa-0.7.12.tar.bz2
	cd bwa-0.7.12
	make
	export PATH=~/src/bwa-0.7.12:$PATH
 
Test installation by running:

    bwa
    
BWA has a nicely formatted manual:

    man ~/src/bwa-0.7.12/bwa.1 


More installation help:

* [Biostar: Installing BWA On 32 Bit Unix Machine](https://www.biostars.org/p/80351/)


[web-blast]: http://blast.ncbi.nlm.nih.gov/Blast.cgi
[local-blast]: ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/