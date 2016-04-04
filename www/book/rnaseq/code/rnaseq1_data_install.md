
In the following we will work through a realistic data protocol that is based on the following publication:

* [Informatics for RNA-seq: A web resource for analysis on the cloud](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004393). 11(8):e1004393.
  PLoS Computational Biology (2015) by Malachi Griffith, Jason R. Walker, Nicholas C. Spies, 
  Benjamin J. Ainscough, Obi L. Griffith 
* The resource is also available online from 
  at [https://github.com/griffithlab/rnaseq_tutorial/wiki](https://github.com/griffithlab/rnaseq_tutorial/wiki)
  
For our tutorial we greatly simplified the data naming and organization
and we make use of an entirely different tool chain and techniques than those 
described in the paper. We do recommend their 
this resource as an alternative tutorial and source of information on alternatives to RNA-Seq 
data analysis.

	# This is the location of the tutorial.
	URL=https://www.biostarhandbook.com/static/data/rnaseq-tutorial-1.tar.gz
	
	# Download the data.
	curl -O $URL
	
	# Unpack the file.
	tar xzvf rnaseq-tutorial-1.tar.gz
	
	# All subsequent commands that we list will be performed relative to the tutorial directory.
	cd rnaseq-tutorial-1