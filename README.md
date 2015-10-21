### Contributing to the Biostar Handbook

Contributions need to be made via GitHub: https://github.com/ialbert/biostar-handbook-web

### Requirements

The web pages are generated with the [pyblue](https://github.com/ialbert/pyblue) 
static site generator from the git repository above. Install pyblue:

    pip install pyblue

To view and edit the site run `make` in the repository. The default action
in the `make` file supports the main usecase of developing new content.
It will start the pyblue server instance and will allow you
to view the result of any changes you make to the pages.

    make
    
Visit `http://localhost:8080` to see the site. Edit any page in
an editor then reload in web browser. See the pyblue docs for
other details.

Restart the server if you add a new file as the directory tree 
is scanned only once on startup. Changes to files however will 
be visible right away.
    
### Content

Content is divided into subdirectories of the  `www/unit` directory. 

1. Web units need to contain all commands used to generate a result.
1. Comments should be used to explain the purpose of each command
1. A web unit can be a plain HTML file,
   may contain markdown as well as Django Templating specific commands.
1. Start with the [example.html](https://github.com/ialbert/biostar-handbook-web/blob/master/www/unit/example.html) 
   file in the repository. Now examine how this file gets rendered at
   [http://biostarhandbook.com/unit/example.html](http://biostarhandbook.com/unit/example.html)
1. Code can be embedded into pages 
   (will be automatically syntax highlighted) or can be linked to as a file.
1. Bootstrap 2.3 styling is enabled.

You can also consult the [pyblue documentation](http://ialbert.github.io/pyblue/) for more details.
