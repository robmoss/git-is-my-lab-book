# First-time Git setup

Once you've installed Git, you should define some important settings before you starting using Git.

1. Define your user name and email address.
   These details are included in **every commit that you create**.

   ```sh
   git config --global user.name "My Name"
   git config --global user.email "my.name@some-university.edu.au"
   ```
2. Define the text editor that Git should use for tasks such as writing commit messages:

   ```sh
   git config --global core.editor editor-name
   ```

   **NOTE:** on Windows you need to specify the full path to the editor:

   ```sh
   git config --global core.editor "C:/Program Files/My Editor/editor.exe"
   ```
3. By default, Git will create a branch called `master` when you create a new repository.
   You can set a different name for this initial branch:

   ```sh
   git config --global init.defaultBranch main
   ```
