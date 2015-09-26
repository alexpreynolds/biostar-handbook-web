## FlexBar

Flexbar is a sequencing data quality control tool. Among
others options it offers the functionality to trim data for quality
and correct adapter contamination.

Website: http://sourceforge.net/projects/flexbar/

Cite: Matthias Dodt, Johannes T. Roehr, Rina Ahmed, Christoph Dieterich:
Flexbar − flexible barcode and adapter processing for next-generation sequencing
platforms. MDPI Biology 2012, 1(3):895-905.

**Mac OSX**:

    cd ~/src
    curl -OL http://downloads.sourceforge.net/project/flexbar/2.5/flexbar_v2.5_macosx.tgz
    tar zxvf flexbar_v2.5_macosx.tgz

    # This program requires an extra variable to be set.
    # These can be set in the profile as well.
    export DYLD_LIBRARY_PATH=~/src/flexbar_v2.5_macosx:$DYLD_LIBRARY_PATH

    # This is a single program that can be linked to ~/bin
    ln -sf ~/src/flexbar_v2.5_macosx/flexbar ~/bin/flexbar

**Linux**:

    cd ~/src
    curl -OL http://downloads.sourceforge.net/project/flexbar/2.5/flexbar_v2.5_linux64.tgz
    tar xzvf flexbar_v2.5_linux64.tgz

    # This program requires an extra variable to be set.
    # These can be set in the profile as well.
    export LD_LIBRARY_PATH=~/src/flexbar_v2.5_macosx:$LD_LIBRARY_PATH

    # This is a single program that can be linked to ~/bin
    ln -sf ~/src/flexbar_v2.5_linux64/flexbar ~/bin/flexbar

**Windows/Cygwin**: Not available.

Test installation by running:

    flexbar
