# Pushing and pulling commits

In general, we "push" commits from our local repository to a remote repository by running:

```sh
git push <remote-repository>
```

and "pull" commits from a remote repository into our local repository by running:

```sh
git pull <remote-repository>
```

where `<remote-repository>` is either a URL **or** the name of a [remote repository](creating-a-remote-repository.md).

However, we generally want to push to, and pull from, the same remote repository every time.
See the next section for an example of linking the main branch in your local repository with a corresponding "upstream" branch in your remote repository.

## Pushing your first commit to a remote repository

In order to push commits from your local repository to a [remote repository](creating-a-remote-repository.md), we need to create a branch in the remote repository that corresponds to the main branch of our local repository.
This requires that you have **created at least one commit** in your local repository.

!!! tip

    This is a good time to create a `README.md` file and write a brief description of what this repository will contain.

Once you have at least one commit in your local repository, you can create a corresponding **upstream branch** in the remote repository with the following command:

```sh
git push -u origin <branch-name>
```

The default branch will probably be called `"main"` or `"master"`, depending on your [Git settings](first-time-git-setup.md).
You can identify the branch name by running:

```sh
git branch
```

!!! note

    Recall that we identify remote repositories by name.
    In this example, the remote repository is call "origin".
    You can choose a different name when [linking your local and remote repositories](creating-a-remote-repository.md#linking-your-local-and-remote-repositories).

Once you have defined the **upstream branch**, you can push commits by running:

```sh
git push
```

and pull commits by running:

```sh
git pull
```

without having to specify the remote repository or branch name.

## Forcing updates to a remote repository

By default, Git will refuse to push commits from a local branch to a remote branch if the remote branch contains any commits that are not in your local branch.
This situation **should not arise** in general, and typically indicates that either someone else has pushed new commits to the remote branch (see the [Collaborating](../collaborating/README.md) section) or that you have altered the history of your local branch.

If you are **absolutely confident** that your local history of commits should replace the contents of the remote branch, you can force this update by running:

```sh
git push --force
```

!!! tip

    Unless you are confident that you understand **why** this situation has occurred, it is probably a good idea to ask for advice before running the above command.
