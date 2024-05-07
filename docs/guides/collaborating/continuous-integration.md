# Continuous integration

Continuous Integration (CI) is an automated process where code changes are merged in a central repository in order to run automated tests and other processes.
This can provide rapid feedback while you develop your code and collaborate with others, as long as commits are regularly pushed to the central repository.

!!! info

    This book is an example of Continuous Integration: every time a commit is pushed to the [central repository](https://github.com/robmoss/git-is-my-lab-book), the [online book](https://git-is-my-lab-book.net/) is automatically updated.

    Because the central repository is hosted on GitHub, we use [GitHub Actions](https://docs.github.com/en/actions/quickstart).
    Note that this is a GitHub-specific CI system.
    You can view the update action for this book [here](https://github.com/robmoss/git-is-my-lab-book/blob/master/.github/workflows/deploy.yml).

    We also use CI to publish each pull request, so that contributions can be previewed during the review process.
    We added this feature in [this pull request](https://github.com/robmoss/git-is-my-lab-book/pull/26).
