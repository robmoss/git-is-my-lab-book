# Where did this line come from?

Consider the [What should I commit?](../version-control/what-should-I-commit.md) chapter.
At the time of writing, the contents of this file came from two commits:

```sh
git log --oneline src/version-control/what-should-I-commit.md
```

```txt
3dfff1f Add notes about committing early and often
9be780b Briefly describe key version control concepts
```

We can use the `git blame` command to identify the commit that last modified each line in this file:

```sh
git blame -s src/version-control/what-should-I-commit.md
```

```txt
9be780b8  1) # What should I commit?
9be780b8  2)
9be780b8  3) A commit should represent a **unit of work**.
9be780b8  4)
9be780b8  5) If you've made changes that represent multiple units of work (e.g., changing how input data are processed, and adding a new model parameter) these should be saved as separate commits.
9be780b8  6)
9be780b8  7) Try describing out loud the changes you have made, and if you find yourself saying something like "I did X and Y and Z", then the changes should probably divided into multiple commits.
3dfff1fe  8)
3dfff1fe  9) A helpful guideline is "**commit early, commit often**".
3dfff1fe 10)
3dfff1fe 11) ## Commit early
3dfff1fe 12)
3dfff1fe 13) - Don't delay creating a commit because "it's not ready yet".
3dfff1fe 14)
3dfff1fe 15) - A commit doesn't have to be "perfect".
3dfff1fe 16)
3dfff1fe 17) ## Commit often
3dfff1fe 18)
3dfff1fe 19) - Small, focused commits are **extremely helpful** when trying to identify the cause of an unintended change in your code's behaviour or output.
3dfff1fe 20)
3dfff1fe 21) - There is no such thing as too many commits.
```

You can see that the first seven lines were last modified by commit `9be780b` (*Briefly describe key version control concepts*), while the rest of the file was last modified by commit `3dfff1f` (*Add notes about committing early and often*).

Without the `-s` argument, each line will also include the author name and timestamp of the commit:

```sh
git blame src/version-control/what-should-I-commit.md
```

```txt
9be780b8 (Rob Moss 2022-04-17 21:36:19 +1000  1) # What should I commit?
9be780b8 (Rob Moss 2022-04-17 21:36:19 +1000  2)
9be780b8 (Rob Moss 2022-04-17 21:36:19 +1000  3) A commit should represent a **unit of work**.
...
```
