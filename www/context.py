__author__ = 'ialbert'

from itertools import *
import django
from django.template.loader import get_template
import sys, os, csv, glob, re

__this = os.path.dirname(__file__) or "."

os.chdir(__this)

# Allow the django template engine to load the custom tags.
sys.path.append(__this)
django.template.base.add_to_builtins("tags.handbook")

def find(target, pattern):
    collect = []
    short = lambda x: x.split('_')[0]

    for root, dirs, names in os.walk(target):
        names = filter(lambda name: re.search(pattern, name), names)
        pairs = map(lambda name: (short(name), os.path.join(root, name)), names)
        collect.extend(pairs)
    collect.sort()
    return collect

# Collect installation files.
TOOL_INSTALL = find("tools", "_install.md")

NAVBAR = [
    ("index.html", '<span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home'),
    ("book/index.html", '<span class="glyphicon glyphicon-book" aria-hidden="true"></span> Book'),
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
stream = open("sitemap.txt", "wb")
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
