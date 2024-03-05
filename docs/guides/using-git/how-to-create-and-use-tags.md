# How to create and use tags

Tags allow you to [bookmark](../version-control/what-is-a-tag.md) important points in your commit history.

You can use tags to identify milestones such as:

- Adding specific features to your model or data analysis (e.g., `feature-age-dependent-mixing`);
- Completing objectives in your research plan (e.g., `objective-1`, `objective-2`);
- Completed manuscript drafts (e.g., `draft-1`, `draft-2`); and
- Manuscript submission and revisions (e.g., `submitted`, `revision-1`).

## Tagging the current commit

You can add a tag (in this example, "my-tag") to the current commit by running:

```sh
git tag -a my-tag
```

This will open your [chosen editor](first-time-git-setup.md) and ask you to write a description for this tag.

## Pushing tags to a remote repository

By default, `git push` **doesn't push tags to remote repositories**.
Instead, you have to explicitly push tags.
You can push a tag (in this example, called "my-tag") to a remote repository (in this example, called "origin") by running:

```sh
git push origin my-tag
```

You can push all of your tags to a remote repository (in this example, called "origin") by running:

```sh
git push origin --tags
```

## Tagging a past commit

To add a tag to a previous commit, you can identify the commit by its hash.
For example, you can inspect your commit history by running:

```sh
git log --oneline --no-decorate
```

If your commit history looks like:

```text
003cf6b Show how to ignore certain files
339eb5a Show how to prepare and record commits
6a7fb8b Show how to clone remote repositories
...
```
where the current commit is `003cf6b` ("Show how to ignore certain files"), you can tag the previous commit ("Show how to prepare and record commits") by running:

```sh
git tag -a my-tag 339eb5a
```

## Listing tags

You can list all tags by running:

```sh
git tag
```

You can also list only tags that match a specific pattern (in this example, all tags beginning with "my") by running:

```sh
git tag --list 'my*'
```

## Deleting tags

You can delete a tag by running:

```sh
git tag --delete my-tag
```

## Creating a branch from a tag

You can check out a tag and begin working on a new branch by running:

```sh
git checkout -b my-branch my-tag
```
