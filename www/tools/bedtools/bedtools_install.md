## Bedtools

The bedtools suite is a collection of command line tools useful for a wide-range of genomic analyses. The most widely used tools are useful for genomic arithmetic or in other words the application of set theory to the analysis of genomic intervals. Common commands include but aren't limited to *intersect*, *subtract*, *merge*, *flank*, *closest*, and *complement*. However, there are many more that can be combined in novel ways to answer an incredible number of biological questions in genomics.

Documentation: http://bedtools.readthedocs.org/en/latest/

**Mac OS X**

    brew update
    brew info bedtools
    brew install bedtools

**Linux**

Fedora/CentOS

    yum install BEDTools

Ubuntu/Debain

    apt-get install bedtools

**Source install**

    cd ~/src
    git clone https://github.com/arq5x/bedtools2
    cd bedtools2
    make

The documentation above offers extensive explanations and graphical examples to better understand how to use the different tools and how they can be combined to answer biologically relevant questions. In addition one can look at this tutorial as well:

Tutorial: http://quinlanlab.org/tutorials/cshl2014/bedtools.html
