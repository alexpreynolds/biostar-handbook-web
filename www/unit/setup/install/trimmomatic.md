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

    # The program can be run as
    java -jar ~/src/Trimmomatic-0.33/trimmomatic-0.33.jar

    # To simplify the invocation create a script in the ~/bin folder:
    echo '#!/bin/bash' > ~/bin/trimmomatic
    echo 'java -jar ~/src/Trimmomatic-0.33/trimmomatic-0.33.jar $@' >> ~/bin/trimmomatic
    chmod +x ~/bin/trimmomatic

Test installation by running:

    trimmomatic
