## Entrez Direct

Entrez Direct consist of a suite of scripts written in the Perl language that can
be used to connect to the NCBI Entrez data interfaces.
The suite includes commands that coresponds to each of the Entrez API endpoints:
`esearch`, `efetch`, `elink`, `efilter`, `epost`, `einfo` as well as a tool called `xtract`
that can be used to extract elements of an XML document.

More informmation: NCBI Webpage: [Entrez Direct Book: E-utilities on the UNIX Command Line]
[edirect-book] and [Entrez Direct Release Notes][release-notes]

[edirect-book]: http://www.ncbi.nlm.nih.gov/books/NBK179288/
[release-notes]: http://www.ncbi.nlm.nih.gov/news/02-06-2014-entrez-direct-released

**Mac OSX**:

    brew update
    brew info edirect
    brew install edirect

**Works on all platforms that support Perl**:

    cd ~/src
    curl ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/edirect.zip -O
    unzip edirect.zip

    # This is a suite of tools thus is best to
    # add the entire directory to the search path.
    export PATH=~/src/edirect:$PATH

    # The tools that can be run are visible in source folder.
    ls ~/src/edirect

Test installation by running:

	efetch -help
	
It will print an output similar to:

	efetch 2.50
	
	-format        Format of record or report
	-mode          text, xml, asn.1, json
	
	-db            Database name
	-id            Unique identifier or accession number
	...
	
To test efetch obtain a dataset:

    efetch -db=nuccore -format=fasta -id=AF086833 | head 

Note: there is a program called `efetch` included with some versions of Linux that is named
identically but is unrelated to the program above.

