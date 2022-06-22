# I found a bug, now what?

Your worst nightmare has come true and you have found a bug. 
What do you do now? 
If you are in the early stages of development this may be as simple as, fix the bug. However, say you are working on a code base and results were presented for publication or policy discussion and you are unsure if this bug was present at the time. 
Without version control it is hard to determine when this bug was introduced and if it will ruin your results (and day). 

If you have been using version control, and have been consistent with your commits, then you have a wonderful tool at your disposal, `git blame`.

```
{{#include git-blame-history.md}}
```