## The LASTZ aligner

The LASTZ aligner is developed by Bob Harris in collaboration with Webb Miller.

It is a program for aligning DNA sequences, a pairwise aligner. 
Originally designed to handle sequences the size of human chromosomes and from different species, 
it is also useful for sequences produced by NGS sequencing technologies such as Roche 454.

* [LASTZ Aligner Webpage](http://www.bx.psu.edu/~rsharris/lastz/)
* [LASTZ Aligner Documentation](http://www.bx.psu.edu/~rsharris/lastz/newer/README.lastz-1.03.73.html)

All platforms (installs the latest version):

 	cd ~/src
	curl -O http://www.bx.psu.edu/~rsharris/lastz/newer/lastz-1.03.73.tar.gz
	tar xzvf lastz-1.03.73.tar.gz 
	cd lastz-distrib-1.03.73/ 
	
	# Build the tool. (see notes below).
	make

	# Link the executable to the ~/bin folder
 	ln -sf ~/src/lastz-distrib-1.03.73/src/lastz ~/bin
 	
The compilation above may fail on the Mac due to overly stringent warnings (treats all warnings as errors).
If that happens edit the file `~/src/lastz-distrib-1.03.73/src/Makefile`  and remove the `-Werror` flag for the
`defineAll` variable. The program should compile successfully.
	
The **Mac OSX** version that installs via brew is an older version though:

	brew update
	brew info lastz
	brew install lastz
	
Test that the installation worked:

	lastz
	
