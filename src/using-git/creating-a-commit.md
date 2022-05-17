# Creating a commit

Creating a commit involves two steps:

1. Identify the changes that should be included in the commit.
   These changes are then "staged" and ready to be included in the next commit.

2. Create a new commit that records these staged changes.
   This should be accompanied by [a useful commit message](../version-control/how-do-I-write-a-commit-message.md).

We will now show how to perform these steps.

```admonish note
At any time, you can see a summary of the changes in your repository, and which ones are staged to be committed, by running:

~~~sh
git status
~~~

This will show you:

1. The files (if any) that contain changes that have been staged;
2. The files (if any) that contain changes that have not been staged; and
3. The files (if any) that are not recorded in the repository history.
```

## Adding a new file

If you've created a new file, you can include this file in the next commit by running:

```sh
git add filename
```

## Adding all changes in an existing file

If you've made changes to an existing file, you can include all of these changes in the next commit by running:

```sh
git add filename
```

## Adding some changes in an existing file

If you've made changes to an existing file and only want to include **some of these changes** in the next commit, you can select the changes to include by running:

```sh
git add -p filename
```

This will show you each of the changes in turn, and allow you select which ones to stage.

```admonish tip
This interactive selection mode is very flexible; you can enter `?` at any of the prompts to see the range of available actions.
```

## Renaming a file

If you want to rename a file, you can use `git mv` to rename the file **and** stage this change for inclusion in the next commit:

```sh
git mv filename newname
```

## Removing a file

If you want to remove a file, you can use `git rm` to remove the file **and** stage this change for inclusion in the next commit:

```sh
git rm filename
```

```admonish tip
If the file has any uncommitted changes, git will refuse to remove the file.
You can override this behaviour by running:

~~~sh
git rm --force filename
~~~
```

## Inspecting the staged changes

To verify that you have staged all of the desired changes, you can view the staged changes by running:

```sh
git diff --cached
```

You can view the staged changes for a specific file by running:

```sh
git diff --cached filename
```

## Undoing a staged change

You may sometimes stage a change for inclusion in the next commit, but decide later that you don't want to include it in the next commit.
You can undo staged changes to a file by running:

```sh
git restore --staged filename
```

```admonish note
This **will not modify** the contents of the file.
```

## Creating a new commit

Once you have staged all of the changes that you want to include in the commit, create the commit by running:

```sh
git commit
```

This will open your [chosen editor](first-time-git-setup.md) and prompt you to write the [commit message](../version-control/how-do-I-write-a-commit-message.md).

```admonish tip
If you decide that you don't want to create the commit, you can abort this action by closing your editor without saving a commit message.
```

## Modifying the most recent commit

After you create a commit, you might decide that there are other changes that should be included in the commit.
Git provides a simple way of modifying the most recent commit.

```admonish warning
**Do not modify the commit** if you have already pushed it to another repository.
Instead, record a new commit that includes the desired changes.

Remember that your commit history should not be a highly-edited, polished view of your work, but should instead act as a lab book.

**Do not worry about creating ["perfect"](../version-control/what-should-I-commit.html) commits!**
```

To modify the most recent commit, stage the changes that you want to commit (see the sections above) and add them to the most recent commit by running:

```sh
git commit --amend
```

This will open your [chosen editor](first-time-git-setup.md) and allow you to modify the commit message.
