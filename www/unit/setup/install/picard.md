## Picard Tools

A set of Java command line tools for manipulating high-throughput sequencing data (HTS) data and formats.

* Webpage: http://broadinstitute.github.io/picard/

**Mac OSX**:

	brew update
	brew info picard-tools
	brew install picard-tools
	
**Source code installation: Mac OSX, Linux, Cygwin/Windows**
You will need to have Apache Ant installed: `apt-get install ant` or
`brew install ant`

```bash
# Obtain the picard distribution.
cd ~/src
git clone git@github.com:broadinstitute/picard.git

# Obtain the htsjdk library.
cd picard
git clone git@github.com:samtools/htsjdk.git

# Builds the library.
ant -lib lib/ant package-commands
```

Test that the installation succeeded:
    
    java -jar ~/src/picard/dist/picard.jar

Create a script that launches picard:

```bash
echo '#!/bin/bash' > ~/bin/picard
echo 'java -jar ~/src/picard/dist/picard.jar $@' >> ~/bin/picard

# Make the script executable
chmod +x ~/bin/picard
```



    
       
  