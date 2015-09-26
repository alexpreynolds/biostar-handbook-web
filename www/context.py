__author__ = 'ialbert'

from itertools import *
import os, csv, glob

__this = os.path.dirname(__file__)
os.chdir(__this)

CHAPTERS = [
    "unix-intro.html",
    "ncbi-entrez.html",
    "short-read-archive.html",
    "fastq-quality-control.html",
    "unix-shell-scripts.html",

    # Keep this last chapter.
    "software-installation-guide.html",
]

NAVBAR = [
    ("index.html", '<span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home'),
    ("about.html", '<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> About'),
    ("search.html", '<span class="glyphicon glyphicon-search" aria-hidden="true"></span>'),
    ("contribute.html", '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>'),
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

__NAMES = [os.path.split(p)[-1] for p in __PATHS]

SETUP_FILES = zip(__NAMES, __PATHS)


