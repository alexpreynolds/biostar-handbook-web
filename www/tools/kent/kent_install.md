## Jim Kent's utilities

The page http://hgdownload.cse.ucsc.edu/admin/exe/ contains a number of utility programs
developed by Jim Kent.

Some of these tools are the only published used converters of formats such as bigWig, bigBed etc.

The way to install the tools is to navigate to the directory that contains binaries for
your platform (Linux/Mac OSX/) then download the tool.

For example `bedGraphToBigWig` on MacOS X:

	# Change this for Linux
	URL=http://hgdownload.cse.ucsc.edu/admin/exe/macOSX.x86_64

	# Get the files
	curl $URL/bedGraphToBigWig > ~/bin/bedGraphToBigWig
	chmod +x ~/bin/bedGraphToBigWig

	curl $URL/faToTwoBit > ~/bin/faToTwoBit
	chmod +x ~/bin/faToTwoBit

You can also obtain all codes an place them into

	mkdir -p ~/bin/kent




