"""
Biostar Handbook specific template tags.
"""
from __future__ import print_function, unicode_literals, absolute_import, division
from django import template
from markdown2 import markdown
import re, logging
from pygments import highlight

import bleach

register = template.Library()

print ("loading template library")

#
# We added a customized Django template tag
# called md anchor that will wraps
# markdown content into
# an html anchor and a back to top link
#
# {% md hello %}
# Hello
# {% endmd %}
# will produce:
#
# <a name="hello">&nbsp</a>
# <p>Hello</p>
# <a href="#top">&laquo; back to top</a>


#
# Based on http://jamie.curle.io/blog/minimal-markdown-template-tag-django/
#

def top_level_only(attrs, new=False):

    if not new:
        return attrs

    text = attrs['_text']
    if not text.startswith(('http:', 'https:')):
        return None

    return attrs

ANCHOR_PATTERN = '<a name="%s">&nbsp;</a>'
TOP_LINK = '<a class="btn btn-default btn-xs btn-info" href="#top">&laquo; back to top</a>'

@register.simple_tag
def top():
    return TOP_LINK

@register.simple_tag
def anchor(name):
    return '<a name="%s">&nbsp;</a>' % name


class MarkDownNode(template.Node):
    CALLBACKS = [ top_level_only ]
    def __init__(self, nodelist, anchor):
        self.nodelist = nodelist
        self.anchor = anchor

    def render(self, context):
        text = self.nodelist.render(context)
        text = markdown(text, safe_mode=False, extras=["code-friendly", "tables"])
        link_anchor = ANCHOR_PATTERN % self.anchor
        text = bleach.linkify(text, callbacks=self.CALLBACKS, skip_pre=True)
        text = link_anchor + text + TOP_LINK
        return text

@register.tag('md')
def markdown_tag(parser, token):
    """
    Enables a block of markdown text to be used in a template.

    Syntax::

            {% markdown %}
            ## Markdown

            Now you can write markdown in your templates. This is good because:

            * markdown is awesome
            * markdown is less verbose than writing html by hand

            {% endmarkdown %}
    """
    nodelist = parser.parse(('endmd',))
    # need to do this otherwise we get big fail
    anchor = token.split_contents()[1]
    parser.delete_first_token()
    return MarkDownNode(nodelist, anchor)