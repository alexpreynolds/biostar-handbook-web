## Contributing to the Biostar Handbook

Contributions need to be made via GitHub: https://github.com/ialbert/biostar-handbook-web

## Requirements

The web pages are generated with the [pyblue](https://github.com/ialbert/pyblue) 
static site generator from the git repository above. Install pyblue:

    pip install pyblue

To serve the site on localhost run `make` in the repository. This will
start the pyblue server instance and will serve the pages

    make
    
Visit `http://localhost:8080` to see the site.

Restart the server if you add a new file as the directory tree is scanned only once
on startup. Changes to files however will be visible right away.
    
## Guidelines

Book chapters and web pages are complementary. 
The content on the web needs to provide complete instructions 
that can be executed when copy pasted into a terminal.

Book chapters should focus on background and big picture explanations.

To create a new book chapter add it to the `book` directory
then open a new issue for it. We'll use that issue to discuss
that chapter. 

To create a new web page add it to the `www/unit` directory with a filename
that starts with three digits: i.e. `123-vcf-format.html`  The three initial 
digits are used to order the sections in the table of contents.

### Book Chapters

All book chapters should be written in Markdown. A few guidelines:

1. Provide a high level overview and context
1. Keep the information short and relevant.
1. Explain command settings only for essential, meaningful and challenging steps. 
   The website will contain all commands that form a full pipeline.
1. Explain thought processes, parameter choices and tacit assumptions.
1. Talk about typical problems, errors and their solutions.
1. Spend time explaining how to interpret the results.
1. Use realistic (published) datasets that can be download either from this website or the SRA (fastq-dump).
1. Reduce datasets to be processable on a MacBook Air in short amounts of time (30 minutes max)
   For example: subselect data for just one short chromosome for human genomes 
1. Don't add data to the github repository, send a link to the data to the maintainer
   and they will move it to the `www/data` directory of the main site.
  
### Web Content

Each book chapter typically has at least on web unit associated with it in  
`www/unit` directory. This file can be a plain HTML file,
may contain markdown as well as Django specific commands.
 
Start with the `example.html` file, take a look of how it gets rendered at
`http://localhost:8080/example.html`

Scripts can be embedded into pages (will be automatically syntax highlighted) or can be linked to.

Bootstrap 2.3 styling is enabled.

You can also consult the [pyblue documentation](http://ialbert.github.io/pyblue/) for more details.
