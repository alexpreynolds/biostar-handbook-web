# What is Bioinformatics?

Bioinformatics makes use of computational 
techniques to advance biological sciences. Before the advent
of high throughput sequencing bioinformatics was closely associated 
with sequence analysis that consisted of  
mostly sequence comparisons and sequence searches. In the 
past decade, starting with 2005, thanks to the introduction of 
high throughput data acquisition instrumentation this scientific
field has expanded rapidly to include applications of much broader 
interests such as gene expression analysis, gene regulation quantification 
and whole genome annotations.  

Bioinformatics is unique among sciences in that 
it heavily relies on and quickly incorporates advances 
made in other scientific disciplines such as biology,
computer science, information technology and statistics.
This makes the field appear somewhat daunting to a novice. 
The good news is that even a introductory understanding of concepts 
from these other disciplines is often 
sufficient, hence successful practitioners don't necessarily need a full 
formal training in each of the related fields. 

One of the most relevant attributes of Bioinformatics as an applied science 
is perhaps captured in the 
[Core services: Reward bioinformaticians (Nature, 2015)][core-services-reward] 
article where the authors conclude with a summary of the type of analyses
that they undertook for others in a bioinformatics consulting setting:

> No project was identical, and we were surprised at 
> how common one-off requests were. 
> There were a few routine procedures that many people wanted, 
> such as finding genes expressed in a disease. 
> But 79% of techniques applied to fewer than 20% of the projects. 
> In other words, most researchers came to the bioinformatics core 
> seeking customized analysis, not a standardized package.

This above formulates the rationale of why this book exists. It is the realization
that Bioinformatics does not
have prescribed standards and linear protocols in the manner that 
most scientists imagine it to. Instead it requires a thorough understanding
of the basic concepts and a solid command of the applicability of each tool
and technique. Using this knowledge bioinformaticians are then expected 
to build unique solutions that match the properties and characteristics 
of each individual project.

[core-services-reward]: http://www.nature.com/news/core-services-reward-bioinformaticians-1.17251

## How does this book work?

The purpose of the book is to give the reader a condensed know-how 
and background information on the data analysis methodologies as
they relate to major fields of life sciences. 
The content is designed to impart brief, to the point and 
dense tidbits of knowledge.

This book is accompanied by a web site http://www.bioinformaticshandbook.com
that contains detailed instructions relating to each of the chapters.
This same website also contains complete pipelines and data analysis procedures 
that demonstrate realistic use cases.

A> **Bioinformatics HandBook Website**
A> 
A> To get the most out of this book you will also need to use the website
A>
A> [http://www.bioinformaticshandbook.com](http://www.bioinformaticshandbook.com)
A>

The code and data that support most analyses presented in this book will be
distributed via this website.

## Who is this book for?

The book is for everyone who wants to know more about what 
bioinformatics is, how it works and what it can do for us. 
It aims to impart practical skills to allow readers to be
able to perform realistic data analyses themselves. The skills that we train for 
are useful beyond the specific applications that we present. 

A> This book is for readers who want to understand
A> the methods and practices used for analyzing large scale biological DNA 
A> sequencing data.

The materials in this book are based and derived from 
experiences, feedback and evaluations
obtained while developing and teaching bioinformatics and 
programming courses to graduate to life scientists.

## What are the goals of the book?

Nobel prize winning physicist Richard Feymann that
once said *What I cannot create, I do not understand.* 
We fully agree, and we want you to be able to perform data analyses yourself.

A> The primary goal of this book is to 
A> enable readers to perform and interpret 
A> computational analyses of sequencing data.

It is meant to be a *one-stop-shop* that provides
all the information that one needs to be self-sufficient,
thus we will provide all introductory background knowledge
that we believe to be necessary to get started in the field.

It is not a biology book but we will cover 
essential elements of biology, it is not a programming
book but will cover 
elements of programming, augmented with a little bit of statistics and
a little bit of visualization.

Importantly, the skills that we want to impart are universal. They can be
used and reused in different contexts, sub-fields and a wide variety of
application domains. We want to teach you how to think algorithmically
and in terms of practical data analysis, which in this case
happens to cover molecular biology and its applications.

Our audience comprises both life scientists who wish to understand
a new dimension of their research field as well as computationally
trained individuals who wish to understand the challenges and
expectations of working in a life science oriented field.

## So what is Bioinformatics, really?

Bioinformatics is the first new scientific field of the
Internet era. It is a computationally oriented scientific
domain that aims to make sense of information 
obtained from living organisms. While it relies on and combines 
concepts and approaches from computer science, software
development and statistical data analytics, it evaluates
its results primarily in terms of gaining new biological
insights into biological processes.

Being a new, information-based science that attempts to
capture the essence of what constitutes life itself, the field has a
tremendous potential to affect society at large. At the same time 
we must recognize that this scientific field is still at its infancy and
as such experiences what we could characterize as "growing pains". These
manifest themselves as 
exaggerated claims and expectations that may be more common than for 
other domains of discourse. As a rule we recommend a healthy dose of skepticism
for any discovery that sounds too good and radical to be true.
As an amusing example note just how many times 
have we discovered the "second genetic code":

* 1988, New York Times, [Second Genetic Code Deciphered, Solving a Protein Synthesis Puzzle][second-genetic-code1]
* 2006, New York Times, [Scientists Say They've Found a Code Beyond Genetics in DNA][second-genetic-code2]
* 2015, Scientific American, [Map of Second Genetic Code, the "Epigenome," Is Unveiled][second-genetic-code3]

It turns out, 
there have been at least six (possibly more)[^seven] second genetic codes discovered so far. 
For a summary see
the blogpost [Another second genetic code][another-second-genetic-code].

[^seven]: Edit: with the 2015 Scientific American article cited above the world has indeed hit the seventh time on discovering the second genomic code!

[second-genetic-code1]: http://www.nytimes.com/1988/05/13/us/second-genetic-code-deciphered-solving-a-protein-synthesis-puzzle.html
[second-genetic-code2]: http://www.nytimes.com/2006/07/25/science/25dna.html?_r=0
[second-genetic-code3]: http://www.scientificamerican.com/article/map-of-second-genetic-code-the-epigenome-is-unveiled/

[another-second-genetic-code]: http://gencodesignal.info/2014/02/04/another-second-genetic-code/

Even bioinformaticians themselves love to disagree about what Bioinformatics actually
is. Clearly the word itself
is built from fusing the words Biology and Informatics, hence it
stands to reason that it must involve some sort of
computational analysis of biological information. 
Based on our more than
decade-long experience in the field we prefer a definition that Morpheus (from the Matrix movie)
would likely tell Neo, if he were to inquire about the term:

A> **Bioinformatics according to Morpheus**
A>
A> Unfortunately, no one can be told what Bioinformatics is. 
A> You have to see it for yourself.

The reason for embracing this definition is perhaps rooted in
the unexpected challenges that just about any new analysis seems
to exhibit. Every  bioinformatician will, and sooner rather 
than later, face unique and peculiar problems for which they feel
that have not been prepared for - 
and the fundamental skill they will need is knowing how to handle 
the unknown. This is quite different from the usual skill of reuse existing 
procedures and following a "protocol". 

But then of course there are people, smarter (or bolder) than us perhaps, that have
attempted to come up with better definitions. Let's see how they fare.
For example the National Institute of Health's working group states:

A> **Bioinformatics according to the NIH**
A>
A> Bioinformatics: Research, development, or application of computational tools and
A> approaches for expanding the use of biological, medical, behavioral or health data,
A> including those to acquire, store, organize, archive, analyze, or visualize such data.
A>
A> Computational Biology: The development and application of data-analytical and
A> theoretical methods, mathematical modeling and computational simulation techniques
A> to the study of biological, behavioral, and social systems.

This definition
distinguishes between *bioinformatics* as targeting data acquisition
and *computational biology* defined as the interpretation of such data.
Unsuprisingly this definition does
not sit well[^hate-NIH-definition] with most bioinformaticians
that we know of. It seems to relegate bioinformaticians as
mere data collectors, book-keepers and bean counters
rather than active participants of the scientific
inquiry. 

[^hate-NIH-definition]: Ok we actually hate it.

In fact the same Nature comment we cited 
above [Core services: Reward bioinformaticians][core-services-reward] 
summarizes its findings as follows:

A> Biological data will continue to pile up unless those who analyse it 
A> are recognized as creative collaborators in need of career paths.

We agree, the field needs far more recognition for the creativity, innovations and unique solutions 
that are required even for "standardized" analyses. Now let's see another, more mainstream definition:

A> **Bioinformatics on Wikipedia, 2015**
A>
A> Bioinformatics is an interdisciplinary field that develops methods and
A> software tools for understanding biological
A> data. [...] Bioinformatics is both an umbrella term for the body of biological
A> studies that use computer programming as part of
A> their methodology, as well as a reference to specific analysis "pipelines" that are repeatedly used, particularly in the
A> fields of genetics and genomics.

The above is a very common definition that unfortunately
lacks specificity. Some of this we could guess just from the two words
that make up the term.
The second sentence hints at a focus on data processing
via "analysis pipelines" and targeting "genomics". But then 
these latter terms would need definitions of their own: 
what exactly constitutes a pipeline? 

A> **Bioinformatics in the Oxford English Dictionary, 2015**
A>
A> The branch of science concerned with information and information
A> flow in biological systems, esp. the use of computational methods
A> in genetics and genomics.

The only thing we like in this surprisingly terse defintion is the 
concept of **information flow** to describe bioinformatics as
being concerned with events that are dynamic
and changing. But other then that this definition is quite cryptic and
leaves a lot to imagination.

It may be that Morpheus was been right all along.