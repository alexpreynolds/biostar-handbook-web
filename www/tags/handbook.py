"""
Biostar Handbook specific template tags.
"""
from django import template

register = template.Library()

print ("loading template library")

@register.simple_tag
def top():
    return '<a href="#top">&laquo; back to top</a>'

@register.simple_tag
def anchor(name):
    return '<a name="%s">&nbsp;</a>' % name
