
The data used is from a study reported in 
[http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2868100/](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2868100/)

In the study the authors considered three types of mouse tissue:

* embryonic stem cells (ESC), 
* neuronal precursor cells (NPC), 
* and lung fibroblasts (LFB).

Get the data:

	# The location of the data.
	URL=https://www.biostarhandbook.com/static/data/rnaseq-tutorial-2.tar.gz
	
	# Download the url.
	curl -O $URL
	
	# Unpack the data
	tar zxvf rnaseq-tutorial-2.tar.gz
	
	# All subsequent commands that we list will be performed relative to the tutorial directory.
	cd rnaseq-tutorial-2
	
    # This will be the index name.
    GENOME=annot/chr7.fa
    IDX=annot/chr7
    
    # Index chromosome 7 of the mouse genome.
    bowtie2-build $GENOME $IDX
    
