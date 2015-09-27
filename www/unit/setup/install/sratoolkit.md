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

Test installation by running:

    fastq-dump -h
