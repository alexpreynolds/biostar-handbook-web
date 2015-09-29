# Install the wrappers for the EMBOSS aligners.
curl https://www.biostarhandbook.com/unit/emboss/global-align.sh > ~/bin/global-align.sh
curl https://www.biostarhandbook.com/unit/emboss/local-align.sh > ~/bin/local-align.sh

# Make the scripts executable.
chmod +x ~/bin/*-align.sh