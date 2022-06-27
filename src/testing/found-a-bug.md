# I found a bug, now what?

Your worst nightmare has come true and you have found a bug. 
What do you do now? 
If you are in the early stages of development this may be as simple as, fix the bug. However, say you are working on a code base and results were presented for publication or policy discussion and you are unsure if this bug was present at the time. 
Without version control it is hard to determine when this bug was introduced and if it will ruin your results (and day). 

If you have been using version control, and have been consistent with your commits, then you have a wonderful tool at your disposal, `git blame`.

``` 
git blame -s -w -M -C src/testing/found-a-bug.md
```

```admonish tip
Once you have found a bug, add more unit tests!
```

After a bug is identified, it is important to ensure that it is completely resolved. 
The bug has occured due to either a "Problem between the chair and computer" or a coding error.
The bug was not identified by your testing suite because of inadequate testing coverage (not enough tests), the possibility of this bug occuring was overlooked (segfaults can be sneaky) or it simply did not matter until this point in time. 

Ensure that as you fix this bug, you write more unit tests to ensure that this bug does not creep back into your code base and that you can have confidence that your code is fixed. 