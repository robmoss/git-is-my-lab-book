# Cloning an existing repository

If there is an existing repository that you want to work on, you can "clone" the repository and have a local copy.
To do this, you need to know the remote repository's URL.

```admonish tip
For GitHub repositories, there should be a green button labelled "Code".
Click on this button, and it will provide you with the URL.
```

You can then make a local copy of the repository by running:

```sh
git clone URL
```

For example, to make a local copy of this book, run the following command:

```sh
git clone https://github.com/robmoss/git-is-my-lab-book.git
```

This will create a local copy in the directory `git-is-my-lab-book`.

```admonish note
If you have a GitHub account and have set up an SSH key, you can clone GitHub repositories using your SSH key.
This will allow you to push commits to the remote repository (if you are permitted to do so) without having to enter your user name and password.

You can obtain the SSH URL from GitHub by clicking on the green "Code" button, and selecting the "SSH" tab.

For example, to make a local copy of this book using SSH, run the following command:

~~~sh
git clone git@github.com:robmoss/git-is-my-lab-book.git
~~~
```
