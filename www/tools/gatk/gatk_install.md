## GATK

The Genome Analysis Toolkit or GATK is a software package for analysis of high-throughput sequencing
data. The toolkit offers a wide variety of tools, with a primary focus on variant discovery and
genotyping.

Website: https://www.broadinstitute.org/gatk/

The software works on all platforms that run java.

**Installation**

Register on the webpage and download the `GenomeAnalysisTK-3.4-46.tar.bz2` file. The version
of the software will change in time.

```
mkdir -p ~/src/gatk
mv ~/Downloads/GenomeAnalysisTK-3.4-46.tar.bz2 ~/src/gatk
cd ~/src/gatk
tar jxvf GenomeAnalysisTK-3.4-46.tar.bz2
```
Test the installation

	java -jar ~/src/gatk/GenomeAnalysisTK.jar -h
	
Create a script that launches `gatk``:

```
echo '#!/bin/bash' > ~/bin/gatk
echo 'java -jar ~/src/gatk/GenomeAnalysisTK.jar $@' >> ~/bin/gatk

# Make the script executable
chmod +x ~/bin/gatk
```

