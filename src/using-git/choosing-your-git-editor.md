# Choosing your Git editor

In this video, we show how to use [nano](https://www.nano-editor.org/) and [vim](https://www.vim.org/) for writing commit messages.
See below for brief instructions on how to use these editors.

```admonish tip
This editor is **only used for writing commit messages**.
It is entirely separate from your choice of editor for any other task, such as writing code.
```

<div class="tabbed-blocks">

<div class="tabbed-block" data-tab-title="Git editor example">
  <div id="demo"></div>

  Video timeline:
  <ol>
    <li><a data-video="demo" data-seek-to="4" href="javascript:;">Overview</a></li>
    <li><a data-video="demo" data-seek-to="17" href="javascript:;">Show how to use nano</a></li>
    <li><a data-video="demo" data-seek-to="71" href="javascript:;">Show how to use vim</a></li>
  </ol>

  <script>
  document.addEventListener("DOMContentLoaded", function(){
      addAsciinemaPlayer('git-editor-example.cast', 'demo');
  });
  </script>
</div>

</div>

## How to use nano

Once you have written your commit message, press <kbd>Ctrl</kbd> + <kbd>O</kbd> and then <kbd>Enter</kbd> to save the commit message, then press <kbd>Ctrl</kbd> + <kbd>X</kbd> to quit the editor.

**To quit without saving** press <kbd>Ctrl</kbd> + <kbd>X</kbd>.
If you have made any changes, `nano` will ask if you want to save them.
Press <kbd>n</kbd> to quit without saving these changes.

## How to use vim

You need to press <kbd>i</kbd> (switch to insert mode) before you can write your commit message.
Once you have written your commit message, press <kbd>Esc</kbd> and then type <kbd>:wq</kbd> to save your changes and quit the editor.

**To quit without saving** press <kbd>Esc</kbd> and then type <kbd>:q!</kbd>.
