## Tabtk

Tabtk is a fast and lightweight tool for processing TAB-delimited formats.
Contains utilites frequently needed when processing
bioinformatics data formats.

    # Basic Unix `cut` (duplicated columns ignored):
    tabtk cut -f 5,1-3,6,6- file.txt

    # Reorder columns:
    tabtk cut -rf 5,1-3,6 file.txt

    # Duplicate columns (duplicated columns not ignored with option `-r`):
    tabtk cut -rf 1,1,1 file.txt

    # Use both SPACE and TAB as the delimitor:
    tabtk cut -d space -f 1-3 file.txt

    # Cut a CSV file:
    tabtk cut -d csv -f 2-4 file.csv

    # Print lines in `streamed.txt` that match `loaded.txt` on the first column:
    tabtk isct loaded.txt streamed.txt

Webpage: https://github.com/lh3/tabtk

**Mac OS X**

    brew update
    brew info tabtk
    brew install tabtk

**Source install on platforms**:

    cd ~/src
    git clone https://github.com/lh3/tabtk
    cd tabtk
    make

    # Link the program to your bin folder
    ln -s ~/src/tabtk/tabtk ~/bin/tabtk

Test installation by running:

    tabtk