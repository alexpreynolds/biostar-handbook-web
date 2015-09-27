## PrinSeq

PrinSeq is a quality control tool written in the Perl language.
It can be used to filter, reformat, or trim your genomic and metagenomic
sequence data. It generates summary statistics of your sequences in
graphical and tabular format. Note: much slower than FlexBar or Trimmomatic.

Web: http://prinseq.sourceforge.net/

Publication: [Schmieder R and Edwards R: Quality control and preprocessing of metagenomic
datasets. Bioinformatics 2011, 27:863-864][prinseq]

[prinseq]: http://bioinformatics.oxfordjournals.org/content/27/6/863.long


**Available on all platforms that run Perl**:

    cd ~/src
    curl -OL http://downloads.sourceforge.net/project/prinseq/standalone/prinseq-lite-0.20.4.tar.gz
    tar zxvf prinseq-lite-0.20.4.tar.gz

    # Link the program into you ~/bin folder under a shorter name.
    ln -sf ~/src/prinseq-lite-0.20.4/prinseq-lite.pl ~/bin/prinseq-lite

    # Set the executable flag on the script/
    chmod +x ~/bin/prinseq-lite

Test installation by running:

    prinseq-lite