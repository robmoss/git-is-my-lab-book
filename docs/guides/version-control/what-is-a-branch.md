# What is a branch?

A branch allows you create a series of commits that are separate from the main history of your repository.
They can be used for units of work that are too large to be a single commit.

!!! info

    It is easy to switch between branches!
    You can work on multiple ideas or tasks in parallel.

Consider a repository with three commits: commit A, followed by commit B, followed by commit C:

![A single branch](branch-1.png)

At this point, you might consider two ways to implement a new model feature.
One way to do this is to create a separate branch for each implementation:

![Multiple branches](branch-2.png)

You can work on each branch, **and switch between them**, in the same local repository.

If you decide that the first implementation (the green branch) is the best way to proceed, you can then **merge** this branch back into your main branch.
This means that your main branch now contains six commits (A to F), and you can continue adding new commits to your main branch:

![Merged branch](branch-3.png)
