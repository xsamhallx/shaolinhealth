#!/usr/bin/env python

"""
convert '---' in docx document to horizontal ruler
"""

from pandocfilters import *

def makehr(key, value, format, meta):
    if key == 'Para' and value == 'Str "---"':
        return HorizontalRule()

if __name__ == "__main__":
    toJSONFilter(makehr)