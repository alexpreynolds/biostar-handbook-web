# RNA-seq Quantification

[unit-xx]: http://bioinformaticshandbook.com/book/unit-xx.html

## What is RNA-seq? Exploring the transcriptome

A common question in molecular biology is what does the population of RNA molecules within a cell look like under condition X? Methods such as qPCR are often seen as the gold standard in nucleic acid quantification but as you scale up to genome wide studies qPCR is typically good only for validation purposes. In the early 1990s microarrays became the method of choice to perform genome wide expression studies. However, it still had several setbacks including designing an array based on probes that you knew came from a unique location in your genome of interest. In the late 2000s, following the advances in second generation sequencing, RNA-seq was invented and quickly surpassed microarrays as the de facto experiment to measure the amount of RNA within cells.

While the raw data from an RNA-seq experiment initially looks very similar to raw data you get from a whole genome sequencing experiment, there are many potential biases that need to be accounted for - some originating from different library preparation protocols and others from the population of RNA itself. For example, due to the presence of alternative splicing in eukaryotic genomes special short read mappers were designed that could predict exon-intron junctions, such as TopHat and STAR.

## Understanding what we're measuring

As with any data set it's important to know more about how it was generated before analyzing it. While theoretically RNA-seq measures in absolute terms the amount of a certain RNA molecule within a population of cells we don't actually measure that directly which can lead to biases that we need to account for. We'll focus here on two of the most important steps where biases can be introduced.

### Errors introduced prior to sequencing

Prior to sequencing biases can be introduced into our data in various ways. The most important things to consider are:

1. How was the population of RNA purified and isolated?
2. How was our population of RNA fragmented?
3. How was our population of RNA sequenced?

Going through each point individually briefly:

(1) It's important to note the diversity in RNA molecules present in cells, especially eukaryotic cells. Even a simple Google search that brings us to [Wikipedia][https://en.wikipedia.org/wiki/List_of_RNAs] tells us that we are looking at RNA species on the order of dozens each with unique functions. Depending on which RNA we're interested in we will likely purify our library using different methods which can introduce different biases. For example, it's common to remove non-mRNAs by purifying to RNAs that contain a poly-A tail. Of course this step isn't necessary. If we were interested in measuring the amount of ncRNA we likely wouldn't purify our population of RNA in order to keep RNAs without a poly-A tail.

(2) Once your population is RNA has been isolated we have to fragment our molecules if we are going to sequence them using current Illumina short read sequencing technology. Illumina instruments unfortunately cannot directly sequence RNA molecules so we need to reverse transcribe our pool of RNA to cDNA. Whether we fragment the RNA prior to or after reverse transcription can introduce different biases into our data. Not to mention the reverse transcription step also carries with it certain biases.

(3) If we are sequencing using Illumina we have the option of performing not just single or paired end sequencing but also strand specific sequencing. This will allow us to assign each read to the strand it originated from so we can tell whether the read we map back to the genome originated from the sense or anti-sense strand.

### Errors introduced post sequencing

Following sequencing the majority of our errors are introduced due improper assignment of reads to a specific feature in our reference genome. This is due to multi-mapped reads and transcript isoforms. For example, consider a gene with multiple transcript isoforms. Several isoforms may only differ at one or two exons or introns and may overlap a considerable amount. If a read overlaps an exon that could belong to one of several isoforms which isoform does it belong it? This is important to consider when we start to talk about quantifying transcript abundance.

## How do we estimate abundance?

Introduce terminology and different methods to calculate abundance (counts, CPM, RPKM/FPKM, TPM...)

## RNA-seq quantification pipeline

Here is where we start getting into the code...Explain what the code does here or do that with comments in the web component to this chapter?

## Interpreting the Results

This is probably the most important section of this unit. Requires strong background in biology and statistics to properly understand.
