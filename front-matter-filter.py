#!/usr/bin/env python

"""
convert '---' in docx document to same in markdown, to preserve front matter
"""

from pandocfilters import *

def makehr(key, value, format, meta):
    if key == 'Str' and value == '---':
        return RawInline('markdown','---')

if __name__ == "__main__":
    toJSONFilter(makehr)