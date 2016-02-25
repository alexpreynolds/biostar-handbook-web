## Bcftools

Bcftools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and
its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both
uncompressed and BGZF-compressed.

Bcftools is designed to work on a stream. It regards an input file "-" as the standard input (stdin)
and outputs to the standard output (stdout). Several commands can thus be combined with Unix pipes.


* Webpage: http://www.htslib.org/
* Bcftools documentation: http://www.htslib.org/doc/bcftools.html
* Short summary on VCF format: http://www.htslib.org/doc/vcf.html
* VCF Specification: http://samtools.github.io/hts-specs/
* The SNP calling method is described in: [The Sequence Alignment/Map format and SAMtools](http://www.ncbi.nlm.nih.gov/pubmed/19505943)


**Mac OSX**:

	brew update
	brew info bcftools
	brew install bcftools
	
**Source code installation: Mac OSX, Linux, Cygwin/Windows**

	cd ~/src
	curl -OL https://github.com/samtools/bcftools/releases/download/1.2/bcftools-1.2.tar.bz2
	tar jxvf bcftools-1.2.tar.bz2
	cd bcftools-1.2
	make
	export PATH=~/src/bcftools-1.2:$PATH


Test that the installation succeeded:
    
    bcftools

    
       
  