## snpEff

Genetic variant annotation and effect prediction toolbox.

Website: http://snpeff.sourceforge.net/

The software works on all platforms that run java.

**Mac OSX**:

	brew update
	brew info snpEff
	brew install snpEff

**Source code installation: Mac OSX, Linux, Cygwin/Windows**

```
mkdir -p ~/src
cd ~/src
curl -OL http://downloads.sourceforge.net/project/snpeff/snpEff_latest_core.zip
```
Test the installation

	java -jar ~/src/snpEff/snpEff.jar -h
	
Create a script that launches `snpEff`:

```
echo '#!/bin/bash' > ~/bin/snpEff
echo 'java -jar ~/src/snpEff/snpEff.jar $@' >> ~/bin/snpEff

# Make the script executable
chmod +x ~/bin/snpEff
```

To use `snpEff` you will need to download annotation databases build for the genomic
builds of interest.

	# Download information on all known databases
	snpEff databases > report.txt

	# Investigate the report
	more report.txt

	# Or search for keywords
	grep "ebola" report.txt

	# Download the ebola genome related annotations.
	snpEff download ebola_zaire

