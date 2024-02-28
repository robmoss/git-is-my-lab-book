# How to use branches?

Recall that [branches](../version-control/what-is-a-branch.md) allow you to work on different ideas or tasks in parallel, within a single repository.
In this chapter, we will show you how create and use branches.
In the [Collaborating](../collaborating/README.md) section, we will show you how branches can allow multiple people to work together on code and papers, and how you can use branches for **peer code review**.

!!! info

    Branches, like [tags](how-to-create-and-use-tags.md), are identified by name.
    Common naming conventions include:

    + `feature/some-new-thing` for adding something new (a new data analysis, a new model feature, etc); and
    + `bugfix/some-problem` for fixing something that isn't working as intended (e.g., perhaps there's a mistake in a data analysis script).

    You can choose your own conventions, but make sure that you choose **meaningful** names.

    **Do not** use names like `branch1`, `branch2`, etc.

## Creating a new branch

You can create a new branch (in this example, called "my-new-branch") that starts from the current commit by running:

```sh
git checkout -b my-new-branch
```

You can also create a new branch that starts from a specific commit, tag, or branch in your repository:

```sh
git checkout -b my-new-branch 95eaae5          # From an existing commit
git checkout -b my-new-branch my-tag-name      # From an existing tag
git checkout -b my-new-branch my-other-branch  # From an existing branch
```

You can then create a corresponding **upstream branch** in your remote repository (in this example, called "origin") by running:

```sh
git push -u origin
```

## Working on a remote branch

If there is a branch in your remote repository that you want to work on, you can make a local copy by running:

```sh
git checkout remote-branch-name
```

This will create a local branch with the same name (in this example, "remote-branch-name").

## Listing branches

You can list all of the branches in your repository by running:

```sh
git branch
```

This will also highlight the current branch.

## Switching between branches

You can switch from your current branch to another branch (in this example, called "other-branch") by running:

```sh
git checkout other-branch
```

!!! info

    Git will not let you switch branches if you have any uncommitted changes.

    One way to avoid this issue is to record the current changes as a new commit, and explain in the commit message that this is a snapshot of work in progress.

    A second option is to discard the uncommitted changes to each file by running:

    ```sh
    git restore file1 file2 file3 ... fileN
    ```

## Pushing and pulling commits

Once you have created a branch, you can use `git push` to "push" your commits to the remote repository, and `git pull` to "pull" commits from the remote repository.
See [Pushing and pulling commits](pushing-and-pulling-commits.md) for details.

## Inspecting branch histories

You can use `git log` to inspect the commit history of any branch:

```sh
git log branch-name
```

Remember that there are [many ways to control](inspecting-your-history.md) what `git log` will show you.

Similarly, you can use `git diff` to compare the changes in any two branches:

```sh
git diff first-branch second-branch
```

Again, there are [ways to control](inspecting-your-history.md) what `git diff` will show you.

## Merging branches

You may reach a point where you want to incorporate the changes from one branch into another branch.
This is referred to as "merging" one branch into another, and is illustrated in the [What is a branch?](../version-control/what-is-a-branch.md) chapter.

For example, you might have completed a new feature for your model or data analysis, and now want to merge this back into your main branch.

First, **ensure that the current branch** is the branch you want to merge the changes **into** (this is often your main or master branch).
You can them merge the changes **from** another branch (in this example, called "other-branch") by running:

```sh
git merge other-branch
```

This can have two different results:

1. The commits from `other-branch` were merged successfully into the current branch; or

2. There were **conflicting changes** (referred to as a "merge conflict").

In the next chapter we will show you [how to resolve merge conflicts](how-to-resolve-merge-conflicts.md).
