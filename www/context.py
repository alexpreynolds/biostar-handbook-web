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
    ("contribute.html", '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add'),
    ("about.html", '<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> About'),
]


# Example numbers. Used for testing.
NUMBERS = range(1, 4)


# Example function call. Used for testing.
def say_hello():
    return "Hello World!"
