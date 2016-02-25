## The LAST aligner

The LAST aligner is developed by Martin Firth.

* [LAST Aligner Webpage](http://last.cbrc.jp/)
* [LAST Aligner Documentation](http://last.cbrc.jp/doc/)
* [Publications describing LAST](http://last.cbrc.jp/doc/last-papers.html)

Installing on all platforms:

 	cd ~/src
	curl -O http://last.cbrc.jp/last-719.zip
	unzip last-719.zip
	cd last-719
	make 
	
Link the executables into the `~/bin` folder

	ln -s ~/src/last-719/src/lastdb ~/bin
	ln -s ~/src/last-719/src/lastal ~/bin
	ln -s ~/src/last-719/src/last-split ~/bin
	
There are a number of utility scripts that could useful. For example

	ln -s ~/src/last-719/scripts/maf-sort ~/bin/

And many others in the `~/src/last-719/scripts/` folder.
The **Mac OSX** version that install with brew is an older version:

	brew update
	brew info last
	brew install last
	
Test that the installation worked:

	lastal -h
	
Using the LAST aligner (data included in the download):

	# A shortcut to the data directory
	D=~/src/last-719/examples/
	
	# Make a LAST database with the human sequence:
	lastdb -c $D/humanMito $D/humanMito.fa

	# Align the mouse mitochondrial genome to the human mitochondrial genome.
	lastal -e25 $D/humanMito $D/mouseMito.fa > output.maf

The output is in the MAF (multiple Alignment Format) not to be confused with MAF (Mutation Alignment Format) ;-)


