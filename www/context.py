__author__ = 'ialbert'

from itertools import *
import os, csv, glob

__this = os.path.dirname(__file__)
os.chdir(__this)

# Collect all chapter names.
names = glob.glob("unit/???-*.html")
names = sorted(names)

ICON_PATT = '<span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> %d'

CHAPTERS = []
for idx, fname in zip(count(1), names):
    __, name = os.path.split(fname)
    CHAPTERS.append(
        (fname, ICON_PATT % idx)
    )

MINI_NAVBAR = [
    ("index.html", '<span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home'),
    ("contribute.html", '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add'),
    ("about.html", '<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> About'),
]

# This is the navigation bar on top.
# NAVBAR = MINI_NAVBAR[:1] + CHAPTERS + MINI_NAVBAR[1:]

# Too many chapters. Need to rethink what will be shown as shortcuts.
NAVBAR = MINI_NAVBAR


# Example numbers.
numbers = range(1, 4)


# Example function call.
def say_hello():
    return "Hello World!"
