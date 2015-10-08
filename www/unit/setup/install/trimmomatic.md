## Trimmomatic

Trimmomatic performs a variety of useful trimming tasks for illumina paired-end
and single ended data.  The software requires java to operate.

Website: http://www.usadellab.org/cms/?page=trimmomatic

Publication: [Bolger, A. M., Lohse, M., & Usadel, B. (2014).
Trimmomatic: A flexible trimmer for Illumina Sequence Data. Bioinformatics][trimmomatic].

[trimmomatic]: http://bioinformatics.oxfordjournals.org/content/30/15/2114

**Works on all platforms that support java**

    cd ~/src
    curl -O http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.33.zip
    unzip Trimmomatic-0.33.zip

    # The program can be invoked via
    java -jar ~/src/Trimmomatic-0.33/trimmomatic-0.33.jar

    # The ~/src/Trimmomatic-0.33/adapters/ directory contains
    # Illumina specific adapter sequences.
    ls ~/src/Trimmomatic-0.33/adapters/

#### Set up Trimmomatic

The way trimmomatic is invoked is a bit awkward:

    java -jar ~/src/Trimmomatic-0.33/trimmomatic-0.33.jar

You can use that invocation or shorten it by creating an executable
script in a file `~/bin/trimmomatic` that looks like this:

    #!/bin/bash
    #
    # The symbol $@ indicates passing all arguments of the script to the program
    #
    java -jar ~/src/Trimmomatic-0.33/trimmomatic-0.33.jar $@

You could even create this file from the command line like so:

    echo '#!/bin/bash' > ~/bin/trimmomatic
    echo 'java -jar ~/src/Trimmomatic-0.33/trimmomatic-0.33.jar $@' >> ~/bin/trimmomatic
    chmod +x ~/bin/trimmomatic

Test installation by running:

    trimmomatic
