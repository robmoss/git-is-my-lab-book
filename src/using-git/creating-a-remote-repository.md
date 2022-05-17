# Creating a remote repository

Once you have created a "local" repository (i.e., a repository that exists on your own computer), it is [generally a good idea](../version-control/what-is-a-repository.md) to create a "remote" repository.
You may choose to store this remote repository on a service such as GitHub, or on a University-provided platform.

If you are using GitHub, you can choose to create a **public** repository (viewable by anyone, but you control who can make changes) or a **private** repository (you control who can view and/or make changes).

## Linking your local and remote repositories

Once you have created the remote repository, you need to link it to your local repository.
This will allow you to "push" commits from your local repository to the remote repository, and to "pull" commits from the remote repository to your local repository.

```admonish note
When you create a new repository on services such as GitHub, they will give you instructions on how to link this new repository to your local repository.
We also provide an example, below.
```

A repository can be linked to more than one remote repository, so we need to choose a name to identify this remote repository.

```admonish info
The name "origin" is commonly used to identify the main remote repository.
```

In this example, we link our local repository to the remote repository for this book (`https://github.com/robmoss/git-is-my-lab-book`) with the following command:

```sh
git remote add origin git@github.com:robmoss/git-is-my-lab-book.git
```

```admonish note
Notice that the URL is similar to, **but not identical to**, the URL you use to view the repository in your web browser.
```
