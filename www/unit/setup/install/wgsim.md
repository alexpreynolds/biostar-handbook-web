## WGsim/DWGsim

Wgsim is a small tool for simulating sequence reads from a reference genome.
It is able to simulate diploid genomes with SNPs and insertion/deletion (INDEL)
polymorphisms, and simulate reads with uniform substitution sequencing errors.
It does not generate INDEL sequencing errors, but this can be partly
compensated by simulating INDEL polymorphisms.

Wgsim outputs the simulated polymorphisms, and writes the true read coordinates
as well as the number of polymorphisms and sequencing errors in read names.
One can evaluate the accuracy of a mapper or a SNP caller with wgsim_eval.pl
that comes with the package.

Webpage: https://github.com/lh3/wgsim

**Source install for wgsim on platforms**:

	cd ~/src
	git clone https://github.com/lh3/wgsim.git
	cd wgsim
	gcc -g -O2 -Wall -o wgsim wgsim.c -lz -lm

	# Link the program to your bin folder
	ln -s ~/src/wgsim/wgsim ~/bin/wgsim

A nicely formatted manual can be accessed via:

	more ~/src/wgsim/README

Test installation by running:

    wgsim

## DWGsim

DWGsim is similarly named tool with more
advanced functionality written by Nils Homer.
This tool offers more options and it can
generate reads corresponding to sequencing platforms:
Illumina, Solid and Ion Torrent.

Webpage: https://github.com/nh13/DWGSIM

**Mac OS X**

	brew update
	brew info dwgsim
	brew install dwgsim

**Source install for dwgsim on platforms**:

	cd ~/src
	git clone --recursive https://github.com/nh13/DWGSIM
	cd DWGSIM
	make

	# Link the program to your bin folder
	ln -s ~/src/DWGSIM/dwgsim ~/bin/dwgsim

Test installation by running:

	dwgsim

