## Readseq

Readseq is a tool that can reformat biological data from
one format to another. For example `GenBank -> Fasta`.
Remember that some changes of format won't make sense for example `Fasta -> GFF`
hence there will be no output.

Webpage: http://iubio.bio.indiana.edu/soft/molbio/readseq/java/


**Mac OS X**

    brew update
    brew info readseq
    brew install readseq

**Works on all platforms that support java**

    mkdir -p ~/src/readseq
    cd ~/src/readseq
    curl -OL http://iubio.bio.indiana.edu/soft/molbio/readseq/java/readseq.jar

    # The program can be run as:
    java -jar ~/src/readseq/readseq.jar

    # To simplify the invocation create a script in the ~/bin folder:
    echo '#!/bin/bash' > ~/bin/readseq
    echo 'java -jar ~/src/readseq/readseq.jar $@' >> ~/bin/readseq
    chmod +x ~/bin/readseq

A nicely formatted manual can be accessed via
at http://iubio.bio.indiana.edu/soft/molbio/readseq/java/Readseq2-help.html

Test installation by running:

    readseq




