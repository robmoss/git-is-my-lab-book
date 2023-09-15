# First-time Git setup

Once you've installed Git, you should define some important settings before you starting using Git.

```admonish info
We assume that you will want to set the git configuration for all repositories owned by your user.
Therefore, we use the `--global` flag.
Configuration files can be set for a single repository or the whole computer by replacing `--global` with `--local` or `--system` respectively.
```

1. Define your user name and email address.
   These details are included in **every commit that you create**.

   ```sh
   git config --global user.name "My Name"
   git config --global user.email "my.name@some-university.edu.au"
   ```
2. Define the text editor that Git should use for tasks such as writing commit messages:

   ```sh
   git config --global core.editor editor-name
   ```

   **NOTE:** on Windows you need to specify the full path to the editor:

   ```sh
   git config --global core.editor "C:/Program Files/My Editor/editor.exe"
   ```
3. By default, Git will create a branch called `master` when you create a new repository.
   You can set a different name for this initial branch:

   ```sh
   git config --global init.defaultBranch main
   ```

4. Ensure that repository histories always record when branches were merged:

   ```sh
   git config --global merge.ff no
   ```

   This prevents Git from ["fast-forwarding"](https://www.atlassian.com/git/tutorials/using-branches/git-merge) when the destination branch contains no new commits.
   For example, it ensures that when you merge the green branch into the blue branch (as shown below) it records that commits *D*, *E*, and *F* came from the green branch.

   ![Merged branch](../version-control/branch-3.png)

5. Adjust how Git shows merge conflicts:

   ```sh
   git config --global merge.conflictstyle diff3
   ```

   This will be useful when we look at [how to use branches](how-to-use-branches.md) and [how to resolve merge conflicts](how-to-resolve-merge-conflicts.md).

```admonish info
If you use Windows, there are tools that can [improve your Git experience in PowerShell](https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-PowerShell).

There are also tools for integrating Git into many common text editors.
See *Git in other environments*, Appendix A of the [Pro Git book](https://git-scm.com/book/en/v2).
```
