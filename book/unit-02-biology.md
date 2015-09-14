# Essential concepts of Biology   

> Some sections of the content below are based
> on an introductory section written by Prof. Webb Miller as part of 
> a Bioinformatics graduate course that he taught at Penn State.

**What is DNA?** DNA is the molecule that carries the genetic 
instructions required for the development, 
functioning and reproduction of all known 
living organisms. A DNA sequence contains only the letters `A`, `C`, `G` and `T`. 
(Each letter represents a small molecule, and a DNA sequence is a "macromolecular" chain of them.) 
Each letter in a DNA sequence is called a base, basepair, or nucleotide. 
Normally, DNA occurs as a double strand where each A is paired with a T and vice versa, 
and each C is paired with a G and vice versa. The reverse complement of a DNA sequence is 
formed by reversing the letters, interchanging A and T and interchanging C and G. 
Thus the reverse complement of `ACCTGAG` is `CTCAGGT`.

**What is DNA Sequencing?**  DNA sequencing is the "catch all" terminology
that describes the processes for identifying the composition of
a DNA macromolecule typically extracted from a living organism. 


**What is a genome?**
A genome is all of an organism's DNA sequence. Each nucleus in one of your cells 
contains its own copy of your genome, which is about 3 billion letters. 
(More accurately, each cell has two nearly identical copies of the genome, 
except that the X and Y chromosomes are even more complicated.) Replication is the 
process of duplicating the genome when a cell divides.

**DNA composition**. The genome of a warm-blooded animal is divided into 
isochores, which are regions of perhaps a few million basepairs in which the
percent of C and G nucleotides is roughly constant. 
(For instance, 43% C and G, and hence 57% A and T.) The term 
dinucleotide refers to a pair of adjacent nucleotides (on the same strand). 
A CpG island is a region of several hundred basepairs where the number of CG 
dinucleotides (i.e., C followed immediately by G) is 
roughly 4% or more of the total. In a random distribution, one would 
expect 1/16, or about 6%, of the dinucleotides to be CG, but there is a 
chemical mechanism that greatly depletes the number of CG dinucleotides, 
so 4% is actually much higher than average.

**From DNA to RNA.** A gene is a region of the genome that contains the instructions 
for making one protein. (Actually, a small fraction of the genes encode RNA molecules 
that are never translated into a protein.) The cell begins to make a protein by 
transcribing the gene into an RNA molecule that is essentially a copy of the gene. 
Then (at least in eukaryotes, i.e., organisms other than bacteria), pieces of the RNA are 
cut out and discarded, in a process called splicing. Each discarded piece (or the corresponding 
part of the genomic template) is called an intron. Part of the cell's method for identifying introns 
is the presence of GT and AG splice signals that usually occur as the first and last dinucleotide of 
an intron. Each piece between consecutive introns is called an exon, and the RNA molecule with the 
introns removed is known as messenger RNA, or mRNA. The original transcript is also processed in other 
ways. The most important is that the region starting 10-30 nucleotides after a polyadenylation signal, 
usually AATAAA, is chopped off and replaced by a string of several hundred A's, called the poly-A tail. 
Perhaps 35% of your genes are alternatively spliced, meaning that under different circumstances, 
different combinations of exons are selected.

**From RNA to DNA.** Under rather unusual conditions, an RNA molecule can be converted back to the 
reverse complement DNA (cDNA) sequence by a process called reverse transcription, which performed 
by a protein called reverse transcriptase. Naturally, the cDNA will not be the same as the original 
genomic template if the introns have been removed, as when an mRNA is reverse transcribed and 
inserted in the genome as a processed pseudogene. (A pseudogene is a genomic sequence that is 
similar to gene but no longer yields a functional protein.) A popular laboratory technique is to 
reverse transcribe mRNAs and perform a simple sequencing process, resulting in sequence data for 
pieces of about 500 bp (bp = basepair) and having a 1-3% error rate. Each resulting sequence is 
called an expressed sequence tag or EST. (Expressing a gene means converting it to the protein 
sequence that it encodes.)

**From RNA to protein.** In eukaryotes, the mRNA is transported out of the nucleus (to the cell's cytoplasm), 
where it is converted to a protein sequence in a process called translation. There are 20 letters in 
the ``alphabet'' of protein sequences, where each letter is an amino acid. To perform the translation, 
the mRNA is conceptually partitioned into units of three consecutive letters, each called a codon. 
There is a genetic code for translating a codon into an amino acid. For example, the codon TCA 
(we sometimes use U in place of T with an RNA sequence) codes for S, the amino acid serine. 
Normally, TAA, TAG and TGA are stop codons; translation stops when one of them is reached. 
Translated sequences begin with the start codon ATG. (ATG codons between the start codon and 
the stop codon are translated to M, the amino acid methionine.) An ORF, or open reading frame, 
is a sequence of at least, say, 100 consecutive codons without a stop codon.

**Other features in genomic DNA.** The region of the mRNA before the start codon (or the 
corresponding genomic region) is called the 5' UTR, or untranslated region; the portion 
from the stop codon to the start of the poly-A tail is the 3' UTR. The genomic region 
just before the 5' UTR contains a pattern of nucleotides, called the promoter, that is 
used to position the molecular machinery that performs the transcription to RNA. For 
about 60% of your genes, the promoter occurs in a CpG island. Other patterns in the DNA 
tell the cell when (how frequently and in what tissues) to transcribe the gene; that is, 
they regulate transcription. A pattern that increases the frequency of transcription 
operations is an enhancer, while one that decreases the frequency is a silencer.

**"Junk" DNA.** Perhaps 50% of your genomic DNA consists of copies of various kinds of 
interspersed repeat sequences. For instance, there are something like 1 million copies 
of a 300-bp element called an Alu, which occurs in all primates. You also have about 
100,000 L1 repeats, which are found in all mammals. A full-length L1 is about 7 kb 
(kb = kilo-basepair), though most of the copies are just short pieces from the 3' end. 
An Alu is an example of a SINE (Short Interspersed Nuclear Element), while an L1 is a
LINE (Long Interspersed Nuclear Element). You also have a lot of tandem repeats, 
such as the dinucleotide repeat ACACACACAC... Lately 
the word "junk" DNA has
become a lightning rod of controversy. 

**Sequence relationships.** Two regions of DNA that are descended from the same sequence 
(through processes of duplication of genomic regions and/or separation of two species) 
are homologous, or homologs of one another. More specifically, regions in the genomes 
of two species that are descended from the same region in a common ancestor's genome 
are orthologous or orthologs. On the other hand, paralogous sequences or paralogs were 
separated by duplication of a genomic region.