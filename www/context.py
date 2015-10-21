__author__ = 'ialbert'

from itertools import *
import django
from django.template.loader import get_template
import sys, os, csv, glob

__this = os.path.dirname(__file__) or "."

os.chdir(__this)

# Allow the django template engine to load the custom tags.
sys.path.append(__this)
django.template.base.add_to_builtins("tags.handbook")

CHAPTERS = [
     # Keep this last chapter.
    "setup/software-installation-guide.html",
    "setup/how-to-install-everything.html",
    "unix/unix-intro.html",
    "entrez/ncbi-entrez.html",
    "ontology/gene-ontology.html",
    "emboss/emboss-intro.html",
    "blast/blast-intro.html",
    "sra/short-read-archive.html",
    "qc/fastq-quality-control.html",
    "unix/unix-shell-scripts.html",
    "align/next-gen-aligners.html",
    "sam/SAM-format.html",
    "programming/programming-intro.html",
    "visualization/genomic-visualization.html",
]

NAVBAR = [
    ("index.html", '<span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home'),
    ("search.html", '<span class="glyphicon glyphicon-search" aria-hidden="true"></span> Search'),
    ("about.html", '<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> Info'),
]


# Example numbers. Used for testing.
NUMBERS = range(1, 4)

# Example function call. Used for testing.
def say_hello():
    return "Hello World!"

# Generate the sitemap automatically.
SKIP = set("500.html 404.html base.html unitbase.html search.html book_link.html".split())
stream = open("sitemap.txt", "wt")
for dirpath, dirnames, files in os.walk(__this):
    files = [_.lower() for _ in files]
    files = filter(lambda x: x not in SKIP, files)
    files = filter(lambda x: x.endswith(".html"), files)

    for name in files:
        path = os.path.relpath(dirpath, __this)
        if path == ".":
            url = "https://www.biostarhandbook.com/%s" % name
        else:
            url = "https://www.biostarhandbook.com/%s/%s" % (path, name)

        stream.write("%s\n" % url)

print ("sitemap generated")
stream.close()

# Setup markdown files.
__PATHS  = glob.glob("unit/setup/install/*.md")

# Get just the name with no extension.
__NAMES = [os.path.split(p)[-1] for p in __PATHS]
__NAMES = [ os.path.splitext(p)[0] for p in __NAMES ]

SETUP_FILES = zip(__NAMES, __PATHS)
