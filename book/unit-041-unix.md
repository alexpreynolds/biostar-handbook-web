# Data analysis at the Unix Command line


[unit-04]: http://bioinformaticshandbook.com/book/unit-03.html


One of the first bottlenecks for scientists wishing to start in the field of bioinformatics is the need of using the command line for launching programs. Most researchers are used to graphical tools and to do most operations with a few clicks. However, for historical and practical reasons most of the bioinformatics nowadays is done using command-line tools on Unix systems. In this chapter we will see how to start using these systems, and why it is important to know them.


## Why do bioinformaticians use Unix systems and not Windows?

Unix is an operating system developed in the '80s, in a time when most computers were big as entire rooms, and each manufacturer was in war with the others and had a different operating system.

When Unix was introduced many innovations, not only it provided an uniform platform for each computer, but it also introduced a novel approach to managing files and programs, which can still be useful 



There are many reasons why Unix systems are still used nowadays. Even if 


## What is Linux? What is Bash? Can I use a Mac?


Linux 



The ability to use simple Unix commands is a fundamental
requirement to performing bioinformatics data analysis with command line tools. 

The Unix world of knowledge is gigantic - the beauty of it
is that unlike other field of knowledge understanding even 
a tiny amounts of it can make someone exceedingly 
more productive. This has to do with the so called [Unix Philosophy][unix-philosophy]
that requires that the contributors to it should:

* Write programs that do one thing and do it well.
* Write programs to work together. 
* Write programs to handle text streams, because that is a universal interface.

In the book called [The Art of Unix Programming][taop] Eric Steven Raymond
discusses in great detail the driving principles of Unix. 
Only fifty or so years later is the genius of the design behind
Unix becoming obvious, these are the principles 
that made it the most ubiquitous computing platform in 
the world - just about all smartphones run Unix. 

That being said over the past fifty or so years the operating system
has also accrued a number of idiosyncrasies and cruft that often
can make it feel very confusing to novices.

## Essential Unix concept and commands

The code repository for this section 
can be accessed at [Code:Unix Command Line][unit-04].

A> This book is not meant to be a full introduction
A> to the Unix command line. There are many well written resources to address
A> this need. We recommend [Unix for Biologists][unix-for-biologist] by Ian Korf.

Interacting with a terminal takes place by typing commands
into it. Getting started with the terminal is the simplest
thing in the world - as long as you set your expectation correctly -  
and that means to set that bar really low. 
Most of the time we start our terminal and
just type a command that we believe should work, for example - 

    $ hello
    -bash: hello: command not found
    
and then turns out it doesn't work at all. That is still good news. 
If you can do it, you are already well on your way to becoming an expert. 
It is our empirical 
observation that more than half of all commands typed into a terminal
will error out for some reason.
 
A> Get used to errors. They will occur all the time. It
A> does not matter how good you become at it, everyone
A> makes the errors all the time. The difference 
A> between a novice and an expert are the speed and
A> efficiency at which they diagnose and correct their errors.

Think this is great news. Stop fretting about errors and start
thinking about correcting them. Recognize that you can only learn 
how to correct errors if you make some. So the best
way to become an expert is to start producing those errors.
 
As long as you are a novice your errors
will be basically be a combination of the following:

1. you are trying to run a tool that does not exist
2. you are tyring to access a file that does not exist

The first error will typically be reported as `command not found`.
Ideally  the second type of error is reported as `file not found` but 
often these failures can report more confusing messages.

### Paths on the file system

It is essential that you understand how to work with paths and files on
a computer system. In essence a file directory forms a tree 
where the root is symbolized by `/`  and each folder and file
is a node in this tree. Files are so called "leaf nodes" (end nodes) 
whereas folders (directories) can contain files and other folders.
 
We can navigate to each node of a tree via `/` separated names
of the nodes, for example a full path to a file could be `/home/john/work/data.txt`. 
This is called and *absolute path*.

Every command that we type in gets exectued in a so called *current working directory*.
Now if we were already located in the directory called `john` we could access
the same file via  `work/data.txt` (note that
the leading `/` is missing) this is called a *relative path*.

Accessing parent nodes is called going up in the tree. Accessing
children nodes is called going down in the tree.

When we start your terminal typically we start in
the so called `home` or `~` directory, to see where that is type:
 
    `pwd`
  
There are a few special path symbols that need to be considered:
current directory: `.`, go down in the tree: `..`, 
home directoy: `~`. Paths can be build with these special marks for example
 `~/work/data.txt` indicates a file in the current user's home directory.
Whereas `../doc/info.txt` would indicate moving up one step then down
into the `doc` folder and specifying the `info.txt` file there. 

Getting into all details of the file system is outside of the scope of
this book and there are numerous excellent tutorials. 
We recommend [Unix & Perl Primer for Biologists][unix-for-biologist] by Ian
Korf or alternatively search the internet
for "working with files on linux".

### Discoverability

How do you find which commands do what? Some of them are very easy
to remember as they are mmenonics: ls (list), mv (move), rm (remove).
Then the information is very easy to find with simple searches.
Don't worry too much about it, even long time unix users discover
new programs they have never heard of before.

Here are a few essential commands:

* print working directory `pwd` 
* create directory `mkdir`
* change current directory `cd`
* move (rename) files: `mv`
* remove (delete files) `rm`
* download files: `curl` or `wget`, 
* see the beginning of a stream: `head`
* see the end of a stream: `tail` 
* cut columns : `cut`
* match patterns: `grep`
* sort a stream: `sort`

You can read a manual page on all commands (other than `cd`) with:

    man 
    man ls
    man mv
    
### Command flags

The most important feature of how the Unix commands work is
that their output can be customized via so called flags. For example:

    # this does something
    ls
    
    # this does the same thing but outputs information differently
    ls -l
    
We call this latter construct `ls` with the `l` (lowercase L) flag. 
See the `-` is the flag pole and the `l` (little L) is the flag itself
fluttering in the sky or something. How many flags can a command have
let's see:

    man ls
    
on the top see:

    ls [-ABCFGHLOPRSTUW@abcdefghiklmnopqrstuwx1] [file ...]

this means that `-A` `-B` `-C` `-F` ...etc are all valid flags. Keep
reading the manual page if you are curious on what flags do.

A> You don't need to understand each flag to use a tool.
A> The vast majority of use cases require only one or two flags
A> per command and we often only need to know about those. 
A> We don't think anyone actually knows all flags for all commands.
A> This is the beauty of Unix - you can be productive if 
A> you understand only a tiny sliver of it.

### Streams

The most elegant Unix contruct is that of a stream. When the terminal
prints to the screen what it does it writes to a stream that gets displayed
in the terminal. We can redirect that stream with the `>` character.

    ls -l > output.txt
    
won't write to the screen anymore, instead it writes the output into the 
`output.txt` file. Note that the `>` character overwrites the contents
of the original file. Hence

    echo "HELLO" > output.txt
    
will overwrite this same file. To append to the file use the `>>` symbols:

    echo "HELLO AGAIN" >> output.txt
    
makes the file contain:

    HELLO
    HELLO AGAIN

Instead of placing the command into a file we may pass the output of one command into
the next. This is called "piping" and the pipe character is `|`. To count the number
of files and folders that open from the current location we could use (`-l` little "ell"):

    ls -l | wc -l
  
This will list the files then pass the output into the next tool for counting lines.
`wc -l` will report the number of lines in a stream.

Actually that is quite correct. For example here is an example of `ls -l`:

    $ ls -l
    total 8
    -rw-r--r--  1 ialbert  staff     2B Sep 11 09:46 readme.txt

You see the long format of `ls` also outputs a number that indicates the 
total sum for all the file sizes. So `wc -l` will be one line longer than
the number of child nodes. Confusingly the correct command in this case 
would be `ls -1` (the number 1). This produces one entry per node.

    $ ls -1
    readme.txt
    
Hence the correct command to count the number of nodes in a directory is:

    ls -1 | wc -l
    
We chose a perhaps atypical and pathological example but this 
situation is not uncommon. The proper defensive measures require
that we test each command on data of known properties for example
run the tool in a folder with known number of nodes and validate
its correctness.

I> Truth to be told these are the principal challenges of Unix. While learning Unix 
I> initially it will seem that the challenge is to find which tool does
I> what  and how to run them so that they execute at all. As it turns
I> out ensuring that tools run correctly and each output does exactly
I> we want is the real challenge. It is very important to adopt a so
I> called "defensive" programming when we continuously verify each step
I> and perform validations.


Work through the code repository for this section
at [Code: Unix Command Line][unit-03]. It demonstrates
the use of Unix command line tools to investigate
a feature file that contains yeas genome specific information.

### Recommended resources

The knowledge about Unix is immense and there are many
paths to get through it. We deliberately chose
to keep this section short as there are 
already many alternatives that interested 
readers may consult. Here are a few 
resources for further study:

* In [Unix & Perl Primer for Biologists][unix-for-biologist] 
the author Ian Korf uses a more gentle introduction
to the concepts - although, as a consequence - it amounts
to almost a standalone book. 
* In [Command-line Bootcamp][command-line-bootcamp] author Keith Bradnam
provides the readers with a basic overview of essential 
Unix/Linux commands that will allow them to navigate 
a file system and move, copy, edit files.
* In [Bioinformatics Data Skills: Reproducible and Robust Research With Open Source Tools][data-skills] 
the author Vince Buffalo spends a considerable amount of 
time and effort detailing the fundamentals of interacting
with Unix and the best practices associated with
project management and software development. 

[command-line-bootcamp]: http://korflab.ucdavis.edu/bootcamp.html
[rescued-by-code]: http://rescuedbycode.com/
[taop]: http://www.catb.org/esr/writings/taoup/html/index.html
[unix-philosophy]: http://www.catb.org/esr/writings/taoup/html/ch01s06.html
[unix-for-biologist]: http://korflab.ucdavis.edu/Unix_and_Perl/index.html
[data-skills]: http://www.amazon.com/Bioinformatics-Data-Skills-Reproducible-Research/dp/1449367372
