## Bedtools

Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of
genomics analysis tasks. The most widely-used tools enable genome arithmetic: that is,
set theory on the genome.

Website: http://bedtools.readthedocs.org/en/latest/  
Tutorial: http://quinlanlab.org/tutorials/cshl2014/bedtools.html

**Mac OSX**:

    brew update
    brew info bedtools
    brew install bedtools

**All Platforms**

Installation is identical on all platforms:

	cd ~/src
	curl -OL https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz
	tar zxvf bedtools-2.25.0.tar.gz
	cd bedtools2
	make

	# Link bedtools to the bin folder
	ln -s ~/src/bedtools2/bin/bedtools ~/bin/bedtools

Test installation by running:

	bedtools
