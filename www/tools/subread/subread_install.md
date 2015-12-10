## subread and featurecounts

Alinger and feature counter

Website: http://bioinf.wehi.edu.au/subread-package/


**Mac OSX**:

	cd ~/src
	curl -L http://sourceforge.net/projects/subread/files/subread-1.5.0/subread-1.5.0-source.tar.gz | tar xzv
	cd subread-1.5.0-source/src
	make -f Makefile.MacOS
	ln -fs ~/src/subread-1.5.0-source/bin/featureCounts ~/bin
	ln -fs ~/src/subread-1.5.0-source/bin/subread-align ~/bin
	ln -fs ~/src/subread-1.5.0-source/bin/subread-buildindex ~/bin

#
# On Linux
#
# make -f Makefile.Linux

# Check that the featureCounts program works
featureCounts
subread-align
