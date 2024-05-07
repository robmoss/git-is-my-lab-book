#!/bin/bash
#
# Detect lines that contain more than one sentence.
#
# We use a regular expression to identify lines that satisfy the following:
#
# 1. They contain at least one letter ('.*[A-Za-z].*'), to ignore numbered
#    list items;
#
# 2. They contain a literal period that is not preceded by a literal period
#    ('[^.]\.'), to ignore ellipses ('...');
#
# 3. The literal period is followed by a regular space ('\. '), to ignore
#    inline periods in common abbreviations (such as 'e.g.,' and 'i.e.,') and
#    in author names where non-breaking spaces should be used to separate
#    initials (e.g., 'Jesse M. Alston' rather than 'Jesse M. Alston').
#
grep --recursive --include='*.md' '^.*[A-Za-z].*[^.]\. ' docs/ && exit 2
