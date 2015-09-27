## FastQC

A veritable workhorse of quality control FastQC is probably the most
commonly used software of high throughput genomics. It is a java
program that should be installed as a command line tool.

Webpage: http://www.bioinformatics.babraham.ac.uk/projects/fastqc/

**MacOS X**:

    brew update
    brew info fastqc
    brew install fastqc

**Works on all platforms that support java**:

    cd ~/src
    curl -O http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.3.zip
    unzip fastqc_v0.11.3.zip

    # Link the fastqc executable to the ~/bin folder that
    # you have already added to the path.
    ln -sf ~/src/FastQC/fastqc ~/bin/fastqc

    # Due to what seems a packaging error
    # the executable flag on the fastqc program is not set.
    # We need to set it ourselves.
    chmod +x ~/bin/fastqc

    # The FastQC/Configuration directory contains a number of files
    # of interest that can be customized if needed.
    ls ~/src/FastQC/Configuration/

Test installation by running:

    fastqc -h

