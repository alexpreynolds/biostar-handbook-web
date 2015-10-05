# RNA-seq Quantification

[unit-xx]: http://bioinformaticshandbook.com/book/unit-xx.html

## What is RNA-seq? Exploring the Transcriptome

A common question in molecular biology is what does the population of RNA molecules within a cell look like under condition X? Methods such as qPCR can give you an answer if you know what RNA molecule you want to measure but this becomes tedious if you need to measure several molecules under several conditions or impossible if you do not know what to look for. High throughput technologies such as microarrays were designed to address this weakness in the 1990s but with the advent of second generation sequencing, it has become more common to use what's known as RNA-seq to address these shortcomings.

Similar to whole genome sequencing, in RNA-seq we're looking to measure and define a population of nucleotides within a population of cells except this time instead of DNA we're interested in RNA. The methodology is highly similar to DNA sequencing, in that you isolate the RNA molecules, you fragment and size select them, and prepare your library for sequencing. The one big difference is that sequencers strictly sequence DNA so before we prepare our library we actually need to reverse transcribe the RNA molecules into DNA using reverse transcriptase. For more information on RNA-seq library preparation see [ADD REFERENCE].

Once the data is generated, theoretically, we should be able to define what the RNA molecule looks like and how many of those molecules exist within the cell at the time fo RNA isolation. This information can be used to answer a lot of questions about the trasnscriptome of interest. Here we will focus on just one piece of information that we can get from RNA-seq data which is the estimation of the abundance of specific RNA molecules within a cell.

## What are the limitations of RNA-seq?

RNA-seq like most methods is not perfect. While we hope to quantify exactly how many molecules of transcript Y exist within a cell in population P, technological limitations prevent us from measuring that directly. Biases are introduced at various steps before estimating abundance and those include but aren't limited to:

1. Measuring RNA from a population of cells
2. Fragmenting and size selection of transcripts
3. Assignment of reads to genomic loci

Each of these has been addressed [ADD REFERENCE] and there are ways to minimize the bias associated with each. What's worth minimizing depends heavily on your question of interest. 

(1) is important because you're making the assumption that the abundance you're calculating is the average seen across all cells of your population. You therefore eliminate the variation between cells and can't truly determine which cells those transcripts are coming from. Recent studies on single cell RNA-seq have shown xxxxxxxxx [ADD REFERENCE]. 

(2) is important because you can no longer capture the entire RNA molecule but instead have to make a guess at what it is by rebuilding it based on overlapping reads. Based on the complexity of the transcriptome under investigation sequence bias can limit your ability to determine full length transcripts.

(3) relates to (2) but is important on its own due to overlapping transcripts, transcript isoforms, and gene families. To rephrase (3) as a set of questions one might ask, which intervals within the genome do my reads overlap? What if one read overlaps more than one interval? What if one read maps to multiple locations in the genome?

Due to these limitations it's important not to overstate our RNA-seq results and claim we're seeing a biological phenomenon that can't be generalized due to the above. It's often best to stick with addressing the biological question of interest that motivated the experiment in the first place.

## How do we estimate abundance?

Introduce terminology and different methods to calculate abundance (counts, CPM, RPKM/FPKM, TPM...)

## RNA-seq quantification pipeline

Here is where we start getting into the code...Explain what the code does here or do that with comments in the web component to this chapter?

## Interpreting the Results

This is probably the most important section of this unit. Requires strong background in biology and statistics to properly understand.
