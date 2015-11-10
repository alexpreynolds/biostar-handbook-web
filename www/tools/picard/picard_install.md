## Picard Tools

A set of Java command line tools for manipulating high-throughput sequencing data (HTS) data and formats.

* Webpage: http://broadinstitute.github.io/picard/

**Mac OSX**:

	brew update
	brew info picard-tools
	brew install picard-tools
	
**Source code installation: Mac OSX, Linux, Cygwin/Windows**

Visit https://github.com/broadinstitute/picard/releases/ to identify the latest release.

```
cd ~/src
# Obtain the picard distribution.
curl -OL https://github.com/broadinstitute/picard/releases/download/1.140/picard-tools-1.140.zip
unzip picard-tools-1.140.zip
```

Test that the installation succeeded:
    
    java -jar ~/src/picard-tools-1.140/picard.jar

Create a script that launches picard:

```
echo '#!/bin/bash' > ~/bin/picard
echo 'java -jar ~/src/picard-tools-1.140/picard.jar $@' >> ~/bin/picard

# Make the script executable
chmod +x ~/bin/picard
```

Test that the script works with:

	picard


    
       
  