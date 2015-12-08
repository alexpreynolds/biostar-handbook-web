## Cufflinks

Website: http://cole-trapnell-lab.github.io/cufflinks/

**Mac OSX** with brew:

    brew update
    brew info cufflinks
    brew install cufflinks

**Note**: The Mac OSX cufflinks obtained as above often crashes even though
it is the newest version.
I believe there is a programming error that causes this.
We may need to roll back and use an older version of cufflinks as below.

	cd ~/src
    curl -L http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.1.1.OSX_x86_64.tar.gz | tar xzv

	# Add this to your PATH or link each program to the bin
	export PATH=/Users/ialbert/src/cufflinks-2.1.1.OSX_x86_64:$PATH

**Linux**:

	cd ~/src
    curl -L http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz | tar xzv
	export PATH=/Users/ialbert/src/cufflinks-2.2.1.Linux_x86_64:$PATH
