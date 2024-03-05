# Choosing your Git editor

In this video, we show how to use [nano](https://www.nano-editor.org/) and [vim](https://www.vim.org/) for writing commit messages.
See below for brief instructions on how to use these editors.

!!! tip

    This editor is **only used for writing commit messages**.
    It is entirely separate from your choice of editor for any other task, such as writing code.

=== "Git editor example"

    <div id="demo" data-cast-file="../git-editor-example.cast"></div>

    Video timeline:

    1. <a data-video="demo" data-seek-to="4" href="javascript:;">Overview</a>
    2. <a data-video="demo" data-seek-to="17" href="javascript:;">Show how to use nano</a>
    3. <a data-video="demo" data-seek-to="71" href="javascript:;">Show how to use vim</a>

!!! note

    You can pause the video to **select and copy any of the text**, such as the ` git config --global core.editor` commands.

## How to use nano

Once you have written your commit message, press <kbd>Ctrl</kbd> + <kbd>O</kbd> and then <kbd>Enter</kbd> to save the commit message, then press <kbd>Ctrl</kbd> + <kbd>X</kbd> to quit the editor.

**To quit without saving** press <kbd>Ctrl</kbd> + <kbd>X</kbd>.
If you have made any changes, `nano` will ask if you want to save them.
Press <kbd>n</kbd> to quit without saving these changes.

## How to use vim

You need to press <kbd>i</kbd> (switch to insert mode) before you can write your commit message.
Once you have written your commit message, press <kbd>Esc</kbd> and then type <kbd>:wq</kbd> to save your changes and quit the editor.

**To quit without saving** press <kbd>Esc</kbd> and then type <kbd>:q!</kbd>.
