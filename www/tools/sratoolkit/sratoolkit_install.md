## SRA toolkit

The SRA tookit allow us to access the Short Read Archive. It is a suite of tools,
the most used among them are: `prefetch`, `fastq-dump`. The SRA toolkit is
distributed as binary programs for each platform.

Webpage: http://www.ncbi.nlm.nih.gov/Traces/sra/?view=software

**Mac OSX**:

    brew update
    brew info sratoolkit
    brew install sratoolkit

**Mac OSX binary**:

    cd ~/src
    curl -OL http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.5.2/sratoolkit.2.5.2-mac64.tar.gz
    tar xzvf sratoolkit.2.5.2-mac64.tar.gz

    # Update the PATH.
    export PATH=~/src/sratoolkit.2.5.2-mac64/bin:$PATH

    # The tools that can be run are visible in:
    ls ~/src/sratoolkit.2.5.2-mac64/bin/

**Unix binary**:

    cd ~/src
    curl -OL http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.5.2/sratoolkit.2.5.2-ubuntu64.tar.gz
    tar xzvf sratoolkit.2.5.2-ubuntu64.tar.gz

    # Update the PATH.
    export PATH=~/src/sratoolkit.2.5.2-ubuntu64/bin:$PATH

    # The tools that can be run are visible in:
    ls ~/src/sratoolkit.2.5.2-ubuntu64/bin/


**Windows/Cygwin binary**:

    cd ~/src
    curl -OL http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.5.2/sratoolkit.2.5.2-win64.zip
    unzip sratoolkit.2.5.2-win64.zip

    # Update the PATH.
    export PATH=~/src/sratoolkit.2.5.2-win64/bin:$PATH

    # The tools that can be run are visible in:
    ls ~/src/sratoolkit.2.5.2-win64/bin/

**Troubleshooting**. This SRA toolkit is notoriously obtuse in its error reporting. Invalid
run IDs will produce a convoluted error message about *virtual database modules* etc.
On some systems the default installation will fail and one needs to run:

    vdb-config --restore-defaults

Test installation by running:

    fastq-dump -X 5 -Z SRR390728
