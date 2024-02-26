# Inspecting your history

You can inspect your commit history at any time with the `git log` command.
By default, this command will list every commit **from the very first commit to the current commit**, and for each commit it will show you:

+ The commit identifier ("hash"), which uniquely identifies this commit;
+ The person who created the commit ("author");
+ The date on which the commit was created; and
+ The commit message.

There are many ways to adjust **which commits** and **what details** that `git log` will show.

!!! tip

    Each commit has a unique identifier ("hash").
    These hashes are quite long, but in general you only need to provide the first 5-7 digits to uniquely identify a specific commit.

## Listing commits over a specific time interval

You can limit which commits `git log` will show by specifying a start time and/or an end time.

!!! tip

    This can be extremely useful for generating **progress reports** and summarising your recent activity in team meetings.

For example, you can view commits from the past week by running:

```sh
git log --since='7 days'
git log --since='1 week'
```

You can view commits made between 1 and 2 weeks ago by running:

```sh
git log --since='2 weeks' --until='1 week'
```

You can view commits made between specific dates by running:

```sh
git log --since='2022/05/12' --until='2022/05/14'
```

## Listing commits that modify a specific file

You can see which commits have made changes to a file by running:

```sh
git log -- filename
```

!!! info

    Note the `--` argument that comes before the file name.
    This ensures that if the file name begins with a `-`, `git log` will not treat the file name as an option.

## Changing how commits are displayed

You can make `git log` display only the first 7 digits of each commit hash, and the first line of each commit message, by running:

```sh
git log --oneline
```

This can be a useful way to get a quick overview of the recent history.

## Viewing the contents of a single commit

You can identify a commit by its unique identifier ("hash") or by its tag name (if it has been tagged), and view the commit with `git show`:

```sh
git show commit-hash
git show tag-name
```

This will show the commit details **and** all of the changes that were recorded in this commit.

!!! tip

    By default, `git show` will show you the most recent commit.

## Viewing all changes over a specific interval

You can view all of the changes that were made between two commits with the `git diff` command.

!!! tip

    The `git diff` command shows the **difference** between two points in your commit history.

    Note that `git diff` **does not** support start and/or end times like `git log` does; you must use **commit identifiers**.
```

For example, here is a subset of the commit history for [this book's repository](https://github.com/robmoss/git-is-my-lab-book):

```text
95eaae5 Note the need for a GitHub account and SSH key
11085f0 Show how to create a branch from a tag
9369482 Show how to create and use tags
003cf6b Show how to ignore certain files
339eb5a Show how to prepare and record commits
6a7fb8b Show how to clone remote repositories
6a49e10 Note that mdbook-admonish must be installed
a8e6114 Fixed the URL for the UoM GitLab instance
5192704 Add a merge conflict exercise
```

We can view all of the changes that were made **after** the bottom commit (`5192704`, "Add a merge conflict exercise") up to **and including** the top commit (`95eaae5`, "Note the need for a GitHub account and SSH key") by running:

```sh
git diff 5192704..95eaae5
```

In the above example, 8 files were changed, with a total of 310 new lines and 7 deleted lines.
This is a lot of information!
You can print a summary of these changes by running:

```sh
git diff --stat 5192704..95eaae5
```

This should show you the following details:

```text
 README.md                                       |   2 +-
 src/SUMMARY.md                                  |   3 +
 src/prerequisites.md                            |   2 +
 src/using-git/cloning-an-existing-repository.md |  36 ++++++++++
 src/using-git/creating-a-commit.md              | 146 +++++++++++++++++++++++++++++++++++++--
 src/using-git/how-to-create-and-use-tags.md     |  89 ++++++++++++++++++++++++
 src/using-git/how-to-ignore-certain-files.md    |  37 ++++++++++
 src/version-control/what-is-a-repository.md     |   2 +-
 8 files changed, 310 insertions(+), 7 deletions(-)
```

This reveals that about half of the changes (146 new/deleted lines) were made to `src/using-git/creating-a-commit.md`.

## Viewing changes to a file over a specific interval

Similar to the `git log` command, you can limit the files that the `git diff` command will examine.
For example, you can display only the changes made to `README.md` in the above example by running:

```sh
git diff 5192704..95eaae5 -- README.md
```

This should show you the following change:

~~~diff
diff --git a/README.md b/README.md
index 7956b65..a34f907 100644
--- a/README.md
+++ b/README.md
@@ -15,7 +15,7 @@ This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 Inter

 ## Building the book

-You can build this book by installing [mdBook](https://rust-lang.github.io/mdBook/) and running the following command in this directory:
+You can build this book by installing [mdBook](https://rust-lang.github.io/mdBook/) and [mdbook-admonish](https://github.com/tommilligan/mdbook-admonish/), and running the following command in this directory:

 ```shell
 mdbook build
~~~
