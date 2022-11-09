# What is a merge conflict?

In [What is a branch?](what-is-a-branch.md) we presented an example of successfully merging a branch into another.
However, when we try to merge one branch into another, we may find that the two branches have conflicting changes.
This is known as a **merge conflict**.

Consider two branches that make conflicting changes to the same line of a file:

1. ```diff
    First line
   -Second line
   +My new second line
    Third line
   ```

2. ```diff
    First line
   -Second line
   +A different second line
    Third line
   ```

There is no way to automatically reconcile these two branches, and **we have to fix this conflict manually**.
This means that we need to decide what the true result should be, edit the file to resolve these conflicting changes, and commit our modifications.
Hi Rob
