# Exercise: create a local repository

<!--


Create a local repository;

Create commits in your local repository;

Search your commit history to identify commits that made a specific change;

Create a remote repository;

Push commits from your local repository to a remote repository;

Pull commits from a remote repository to your local repository;

Use tags to identify important milestones;

Work in a separate branch and then merge your changes into your main branch;

-->

In this exercise you will create a local repository, and use this repository to create multiple commits, switch between branches, and inspect the repository history.

Git commands may be run through a CLI, such as Command Prompt/Bash, or through a GUI like Visual Studio Code (VSC). 
* Shell [docs](https://git-scm.com/docs)
* VSC [docs](https://code.visualstudio.com/docs/sourcecontrol/overview)

1. Create a new directory called `git-exercise`.
   * Shell: `mkdir git-exercise`.
   * VSC: `Open folder` from the file tab and then use the create folder button from your file manager.
    
2. Navigate into the directory and initalize an empty Git repository.
   * Shell: `cd git-exercise && git init`.
   * VSC: Source Control `alt+shift+G` in the side panel, and then click initialize repository button.
  
3. Create a `README.md` file and write a [brief description](how-to-structure-a-repository.md#include-a-readme-file) for this repository.
   Record the contents of `README.md` in a new commit by staging the file `git add README.md`, and then write a [commit message](../version-control/how-do-I-write-a-commit-message.md).

4. Write a script that generates a small data set, and saves the data to a CSV file.
   For example, this script could sample values from a probability distribution with fixed shape parameters.
   Explain how to use this script in `README.md`.
   Record your changes in a new commit.

5. Write a script that plots these data, and saves the figure in a suitable file format.
   Explain how to use this script in `README.md`.
   Record your changes in a new commit.

6. Add a tag `milestone-1` to the commit you created in the previous step.

7. Create a new branch called `feature/new-data`.
   Check out this branch and modify the data-generation script so that it produces new data and/or more data.
   Record your changes in one or more new commits.

8. Create a new branch called `feature/summarise` from the tag you created in step #5.
   Check out this branch and modify the plotting script so that it also prints some summary statistics of the data.
   Record your changes in one or more new commits.

9. In your `main` or `master` branch, and [add a license](choosing-a-license.md).
   Record your changes in a new commit.

10. In your `main` or `master` branch, merge the two feature branches created in steps #6 and #7, and add a new tag `milestone-2`.

## Self evaluation

Now that you have started a repository, created commits in multiple branches, and merged these branches, here are some questions for you to consider:

- Have you committed the generated data file and/or the plot figure?

- If you haven't committed either or both of these files, have you instructed `git` to ignore them?

- Did you add a meaningful description to each milestone tag?

- How many commits modified your data-generation script?

- How many commits modified your plotting script?

- What changes, if any, were made to `README.md` since it was first created?

```admonish tip
To answer some of these questions, you may need to run `git` commands.
```
