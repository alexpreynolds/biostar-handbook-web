Biostar Handbook Website

# Requirements

The web pages are generated with the [pyblue](https://github.com/ialbert/pyblue) 
static file generator. 

Install pyblue

    pip install pyblue

Then in the run the Makefile in the repository

    make
    
Visit `http://localhost:8080` to see the site.
    
# Contributing

## Guidelines


## Book Chapters

The book chapters should contain information in a condensed format.
They should focus on discussing the big picture, establishing proper context,
focus on the thought process and interpretation details rather than
on what the steps are exactly.

1. Avoid criticism instead focus on solutions
1. Use realistic datasets that can be download either from this website or the SRA (fastq-dump).
1. Reduce datasets to be processable on a MacBook Air in short amounts of time (30 minutes max)
  (For example: subselect data for just on a short chromosome for human genomes) 
  don't add data to the github repository though, send a link to the maintainer
  and they will move it to the `www/data` directory of the main site.
  
To create a new book chapter add it to the `book` directory
then open a new issue for it. We'll use that issue to discuss
that chapter.

All book chapters should be written in Markdown.

## Web content

Each book chapter typically has an associated file in the 
`www/unit` directory. This file can be a plain HTML file,
may contain markdown as well as Django specific commands.
 
Start with the `example.html` file, take a look of how it gets rendered at
http://localhost:8080/example.html

You can also consult the [pyblue documentation](http://ialbert.github.io/pyblue/) for more details.
