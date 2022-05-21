# Where did this problem come from?

Let's find the commit that created the file `src/version-control/what-is-a-repository.md`.
We could find this out using `git log`, but the point here is to illustrate how to use a script to **find the commit that causes any arbitrary change** to our repository.

Once the commit has been found, you can inspect it (using `git show <commit>`) to see all of the changes this commit introduced **and** the commit message that (hopefully) explains the reasons why this commit was made.
This is one way in which **your commit messages can act as a lab book**.

1. Create a Python script called `my_test.py` with the following contents:

    ```py
    #!/usr/bin/env python3
    from pathlib import Path
    import sys

    expected_file = Path('src') / 'version-control' / 'what-is-a-repository.md'

    if expected_file.exists():
        # This file is the "new" thing that we want to detect.
        sys.exit(1)
    else:
        # The file does not exist, this commit is "old".
        sys.exit(0)
    ```

    For reference, here is an equivalent R script:

    ```R
    #!/usr/bin/Rscript --vanilla

    expected_file <- file.path('src', 'version-control', 'what-is-a-repository.md')

    if (file.exists(expected_file)) {
        # This file is the "new" thing that we want to detect.
        quit(status = 1)
    } else {
        # The file does not exist, this commit is "old".
        quit(status = 0)
    }
    ```

2. Select the commit range over which to search.
   We know that the file exists in the commit `3dfff1f` (*Add notes about committing early and often*), and it did not exist in the very first commit (`5a19b02`).

3. Instruct Git to start searching with the following command:

   ```sh
   git bisect start 3dfff1f 5a19b02
   ```

   Note that we specify **the newer commit first**, and then the older commit.

   Git will inform you about the search progress, and which commit is currently being investigated.

   ```txt
   Bisecting: 7 revisions left to test after this (roughly 3 steps)
   [92f1375db21dd8a35ca141365a477b963dbbf6dc] Add CC-BY-SA license text and badge
   ```

4. Instruct Git to use the script `my_test.py` to check each commit with the following command:

   ```sh
   git bisect run ./my_test.py
   ```

   It will continue to report the search progress and **automatically identify** the commit that we're looking for:

   ```txt
   running  './my_test.py'
   Bisecting: 3 revisions left to test after this (roughly 2 steps)
   [9be780b8785d67ee191b2c0b113270059c9e0c3a] Briefly describe key version control concepts
   running  './my_test.py'
   Bisecting: 1 revision left to test after this (roughly 1 step)
   [055906f28da146a2d012b7c1c0e4707503ed1b11] Display example commit message as plain text
   running  './my_test.py'
   Bisecting: 0 revisions left to test after this (roughly 0 steps)
   [1251357ab5b41d511deb48cd5386cae37eec6751] Rename the "What is a repository?" source file
   running  './my_test.py'
   1251357ab5b41d511deb48cd5386cae37eec6751 is the first bad commit
   commit 1251357ab5b41d511deb48cd5386cae37eec6751
   Author: Rob Moss <robm.dev@gmail.com>
   Date:   Sun Apr 17 21:41:43 2022 +1000

       Rename the "What is a repository?" source file

       The file name was missing the word "a" and did not match the title.

    src/SUMMARY.md                              |  2 +-
    src/version-control/what-is-a-repository.md | 18 ++++++++++++++++++
    src/version-control/what-is-repository.md   | 18 ------------------
    3 files changed, 19 insertions(+), 19 deletions(-)
    create mode 100644 src/version-control/what-is-a-repository.md
    delete mode 100644 src/version-control/what-is-repository.md
   ```

5. To quit the search and return to your current commit, run the following command:

    ```sh
    git bisect reset
    ```

6. You can then [inspect this commit](inspecting-your-history.md) by running the following command:

    ```sh
    git show 1251357
    ```
