# Sharing a branch

You might want a collaborator to work on a specific branch of your repository, so that you can keep their changes separate from your own work.
Remember that you can merge commits from their branch into your own branches at any time.

```admonish info
You need to ensure that your collaborator [has access to the remote repository](sharing-a-repository.md).
```

1. Create a new branch for the collaborator, and give it a descriptive name.

   ```sh
   git checkout -b collab/jamie
   ```
   In this example we created a branch called "collab/jamie", where "collab" is a prefix used to identify branches intended for collaborators, and the collaborator is called Jamie.

   Remember that you can [choose your own naming conventions](../using-git/how-to-use-branches.md).

2. Push this branch to your remote repository:

   ```sh
   git push -u origin
   ```

3. Your collaborator can then make a local copy of this branch:

   ```sh
   git clone --single-branch --branch collab/jamie repository-url
   ```

4. They can then create commits and push them to your remote repository with `git push`.
