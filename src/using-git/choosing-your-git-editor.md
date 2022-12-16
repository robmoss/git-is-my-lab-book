# Choosing your Git editor

In this video, we show how to use [nano](https://www.nano-editor.org/) and [vim](https://www.vim.org/) for writing commit messages.
See below for brief instructions on how to use these editors.

```admonish tip
This editor is **only used for writing commit messages**.
It is entirely separate from your choice of editor for any other task, such as writing code.
```

<div class="tabbed-blocks">

<div id="demo" class="tabbed-block" data-tab-title="Git editor example"></div>
<script>
document.addEventListener("DOMContentLoaded", function(){
    AsciinemaPlayer.create(
        'git-editor-example.cast',
        document.getElementById('demo'),
        { poster: 'npt:0:1', theme: 'dracula' });
});
</script>

</div>

## How to use nano

Once you have written your commit message, press `Ctrl+O` to save the commit message, then press `Ctrl+X` to quit the editor.

**To quit without saving** press `Ctrl+X`.
If you have made any changes, `nano` will ask if you want to save them.
Press `n` to quit without saving these changes.

## How to use vim

You need to press `i` (switch to insert mode) before you can write your commit message.
Once you have written your commit message, press `Esc` and then type `:wq` to save your changes and quit the editor.

**To quit without saving** press `Esc` and then type `:q!`.
