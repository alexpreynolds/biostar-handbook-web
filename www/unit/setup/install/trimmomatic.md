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

    # To shorten the invocation above we can use command aliases or write a shell script.

    # Creating an alias.
    alias trimmomatic='java -jar ~/src/Trimmomatic-0.33/trimmomatic-0.33.jar'

    # Creating a shell script under ~/bin/trimmomatic
    # This will be a shell script that passes all command line
    # parameters to the java program with the $@ construct
    echo '#!/bin/bash' > ~/bin/trimmomatic
    echo 'java -jar ~/src/Trimmomatic-0.33/trimmomatic-0.33.jar $@' >> ~/bin/trimmomatic

    # make the shell script executable
    chmod +x ~/bin/trimmomatic

    # The ~/src/Trimmomatic-0.33/adapters/ directory contains
    # Illumina specific adapter sequences.
    ls ~/src/Trimmomatic-0.33/adapters/

Test installation by running:

    trimmomatic
