# Exercise: use a remote repository

In this exercise, you will use a remote repository to synchronise and merge changes between multiple local repositories, starting from the local `git-exercise` repository that you created in [the previous exercise](exercise-create-a-local-repository.md).

## Create a remote repository

1. Create a new remote repository on a platform such as GitHub.
   You can make this a **private** repository, because you won't need to share it with anyone.

2. Link your local `git-exercise` repository to this remote repository, and push all branches and tags to this remote repository.

## Clone the remote repository

1. Make a local copy of this remote repository called `git-exercise-2`.

2. Check out the `main` or `master` branch.
   The files should be identical to the `milestone-2` tag in your original `git-exercise` repository.

## Work on the new local repository

1. Create a new branch called `feature/report`.
   Check out this branch and create a new file called `report.md`.
   Edit this file so that it contains:

   - A brief description of the generated data set;
   - A table of the summary statistics printed by the plotting scripting (see the [Markdown Guide](https://www.markdownguide.org/extended-syntax/#tables)); and
   - The figure produced by the plotting script (see the [Markdown Guide](https://www.markdownguide.org/basic-syntax/#images-1)).

   Record your changes in a new commit.

2. Push this new branch to the remote repository.

## Merge the report into the original repository

1. In your original `git-exercise` repository, checkout the `feature/report` branch from the remote repository and verify that it now contains the file `report.md`.

2. Merge this branch into your `main` or `master` branch, and add a new tag `milestone-3-report`.

3. Push the updated `main` or `master` branch to the remote repository.

## Update the new local repository

1. In your `git-exercise-2` repository, checkout the `main` or `master` branch and pull changes from the remote repository.
   It should now contain the file `report.md`.

!!! info

    Congratulations!
        You have used a remote repository to synchronise and merge changes between two local repositories.
    You can use this workflow to [collaborate with colleagues](../collaborating/README.md).

## Self evaluation

Now that you have used commits and branches to share work between multiple repositories, here are some questions for you to consider:

- Do you feel comfortable in deciding which changes to record in a single commit?

- Do you feel that your commit messages help describe the changes that you have made in this repository?

- Do you feel comfortable in using multiple branches to work on separate ideas in parallel?

- Do you have any current projects that you might want to work on using local and remote `git` repositories?
