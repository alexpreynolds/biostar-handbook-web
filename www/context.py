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

# This is the navigation bar on top.
NAVBAR = [
                ("index.html", '<span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home'),
         ] + CHAPTERS + [
                ("license.html",  '<span class="glyphicon glyphicon-copyright-mark" aria-hidden="true"></span> License'),
                ("contribute.html",  '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Contribute'),
                ("about.html",  '<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> About'),
         ]


# Example numbers.
numbers = range(1, 4)

# Example function call.
def say_hello():
    return "Hello World!"
