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

The information on the mutations that a read was subjected
to is embedded into the read name in the form: `chr1_6181150_6181637_2:0:0_2:0:0_2/1`:

> By default, wgsim simulates a diploid genome with indels and then
> simulates reads from the simulated genome without indels. In the example
> above, the first 2:0:0 indicates that the first read has two sequencing
> errors and that no substitution and no gaps are involved in the
> simulated genome. The second 2:0:0 is for the second read. As sequencing
> errors and substitutions are added separately, they may overlap. You may
> apply "-e 0.0" to disable sequencing errors.

Both the `wgswim` and `dwgsim` distributions come with evaluation scripts
`wgsim_eval.pl` and `dwgsim_eval` that can be used evaluate mapping
qualities of SAM files where the reads names are encoded as above.
The scripts will parse the read name and compare the results to 
the alignment and, from that establish mapping accuracy.

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


