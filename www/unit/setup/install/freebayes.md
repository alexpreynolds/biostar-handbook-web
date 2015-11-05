## FreeBayes

Bayesian haplotype-based polymorphism discovery and genotyping. 

Publication: [Haplotype-based variant detection from short-read sequencing][freebayes-pub]

Website: [https://github.com/ekg/freebayes][freebayes-web]

[freebayes-pub]: http://arxiv.org/abs/1207.3907
[freebayes-web]: https://github.com/ekg/freebayes

Prerequisites install `cmake`:

**MacOSX**:

	brew install cmake
	
**Linux**

	apt-get install cmake

Main installation instructions

**Mac OSX and Linux installation**:

	cd ~/src
	git clone --recursive git://github.com/ekg/freebayes.git
	cd freebayes
	make
	# For reasons that I don't yet understand the first make command
	# fails but the second succeeds.
	make
	ln -s ~/src/freebayes/bin/freebayes ~/bin/freebayes
 
Test installation by running:

    freebayes
    