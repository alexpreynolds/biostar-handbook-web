## TopHat

Note that this program requires that Bowtie2 be installed as well.

Website: https://ccb.jhu.edu/software/tophat/index.shtml

**Mac OSX** with brew:

    brew update
    brew info tophat
    brew install tophat

**Mac OSX** manual install:

    cd ~/src
    curl -O https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.0.OSX_x86_64.tar.gz
    tar xzvf tophat-2.1.0.OSX_x86_64.tar.gz

    # This is a suite of tools thus is best to
    # add the entire directory to the search path.
    export PATH=~/src/tophat-2.1.0.OSX_x86_64:$PATH

    # See the progams included with TopHat.
    ls ~/src/tophat-2.1.0.OSX_x86_64

**Linux**:

    cd ~/src
    curl -O https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.0.Linux_x86_64.tar.gz
    tar xzvf tophat-2.1.0.Linux_x86_64.tar.gz

    # This is a suite of tools thus is best to
    # add the entire directory to the search path.
    export PATH=~/src/tophat-2.1.0.Linux_x86_64:$PATH

    # See the progams included with TopHat.
    ls ~/src/tophat-2.1.0.Linux_x86_64

**Windows/Cygwin**:

The program is not available for Cygwin/Windows.