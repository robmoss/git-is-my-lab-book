# Techniques and tools

## Identifying errors

How to read tracebacks?

## Developing a plan

Version control, last known good version, `git bisect`.

## Searching for the root cause

Print statements, debuggers, REPLs, last good version, recent changes, assert statements, comment out code ...

## Fixing the root cause

Is there an optimal solution?
Smallest change or least effect on the rest of your code?
Does the best solution involve restructuring or modifying other parts of your code?

## After it's fixed

Test cases, defensive programming, shorten the feedback loop, what coding practices might make such a mistake easier to find next time (e.g., small functions, frequent commits).

Document your experience!
