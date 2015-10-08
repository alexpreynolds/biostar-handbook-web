## BBMap

This package includes BBMap, a short read aligner, as well as various other bioinformatic tools. It is written in pure Java, can run on any platform, and has no dependencies other than Java being installed (compiled for Java 6 and higher). All tools are efficient and multithreaded.

* `BBMap`: Short read aligner for DNA and RNA-seq data. Capable of handling arbitrarily large genomes with millions of scaffolds. Handles Illumina, PacBio, 454, and other reads; very high sensitivity and tolerant of errors and numerous large indels. Very fast.

* `BBNorm`: Kmer-based error-correction and normalization tool.

* `Dedupe`: Simplifies assemblies by removing duplicate or contained subsequences that share a target percent identity.

* `Reformat`: Reformats reads between fasta/fastq/scarf/fasta+qual/sam, interleaved/paired, and ASCII-33/64, at over 500 MB/s.

* `BBDuk`: Filters, trims, or masks reads with kmer matches to an artifact/contaminant file. 

**All Platforms**

Installation is identical on all platforms:

	cd ~/src
	curl -OL http://sourceforge.net/projects/bbmap/files/BBMap_35.50.tar.gz
	tar zxvf BBMap_35.50.tar.gz
	export PATH=~/src/bbmap:$PATH
 
Test installation by running:

    bbmap.sh
