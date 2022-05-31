# Merge/Pull requests

Recall that [incorporating the changes from one branch into another branch](../using-git/how-to-use-branches.md#merging-branches) is referred to as a "merge".
You can merge one branch into another branch by taking the following steps:

1. Checking out the branch you want to merge the changes **into**:

   ```sh
   git checkout -b my-branch
   ```

2. Merging the changes **from** the other branch:

   ```sh
   git merge other-branch
   ```

```admonish tip
It's a good idea to **review these changes** before you merge them.

If possible, it's even better to have **someone else** review the changes.
```

You can use `git diff` to [view differences between branches](../using-git/how-to-use-branches.md#inspecting-branch-histories).
However, platforms such as GitHub and GitLab offer an easier approach: "pull requests" (also called "merge requests").

## Creating a pull request on GitHub

The steps required to create a pull request differ depending on which platform you are using.
Here, we will describe how to create a pull request on GitHub.
For further details, see the [GitHub documentation](https://docs.github.com/en/pull-requests).

- Open the main page of your GitHub repository.

- In the "Branch" menu, select the branch that contains the changes you want to merge.

- Open the "Contribute" menu.
  This should be located on the right-hand side, above the list of files.

- Click the "Open pull request" button.

- In the "base" menu, select the branch you want to merge the changes **into**.

- Enter a descriptive title for the pull request.

- In the message editor, write a summary of the changes in this branch, and identify **specific questions or objectives** that you want the reviewer to address.

- Select **potential reviewers** by clicking on the "Reviewers" link in the right-hand sidebar.

- Click the "Create pull request" button.

Once the pull request has been created, the reviewer(s) can review your changes and discuss their feedback and suggestions with you.

## Merging a pull request on GitHub

When the pull request has been reviewed to your satisfaction, you can merge these changes by clicking the "Merge pull request" button.

```admonish info
If the pull request has merge conflicts (e.g., if the branch you're merging **into** contains new commits), you will need to [resolve these conflicts](../using-git/how-to-resolve-merge-conflicts.md).
```

For further details about merging pull requests on GitHub, see the [GitHub documentation](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/merging-a-pull-request).
