# How to contribute

## Add a case study

If you've made use of Git in your research activities, **please let us know!**
We're looking for [case studies](case-studies/README.md) that highlight how EMCRs are using Git.
See the instructions for suggesting new content (below).

## Provide comments and feedback

The easiest way to provide comments and feedback is to [create an issue](https://github.com/robmoss/git-is-my-lab-book/issues).
Note that this requires a GitHub account.
If you do not have a GitHub account, you can email any of the authors.
Please include "Git is my lab book" in the subject line.

## Suggest modifications and new content

This book is written in Markdown and is published using [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).
See the [Material for MkDocs Reference](https://squidfunk.github.io/mkdocs-material/reference/) for an overview of the supported features.

You can suggest modifications and new content by:

- Forking [the book repository](https://github.com/robmoss/git-is-my-lab-book);

- Adding, deleting, and/or modifying book chapters in the `docs/` directory;

- Recording your changes in one or more git commits; and

- [Creating a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request), so that we can review your suggestions.

!!! info

    You can also edit any page by clicking the "Edit this page" button (:material-file-edit:) in the top-right corner.
    This will start the process described above by forking the book repository.

!!! tip

    When editing Markdown content, please **start each sentence on a separate line**.
    Also check that your text editor **removes trailing whitespace**.

    This ensures that each commit will contain only the modified sentences, and makes it easier to inspect the repository history.

!!! tip

    When you add a new page, you must also **add the page to the `nav` block** in [`mkdocs.yml`](https://github.com/robmoss/git-is-my-lab-book/edit/master/mkdocs.yml).

## Adding tabbed code blocks

You can display content in [multiple tabs](https://squidfunk.github.io/mkdocs-material/reference/content-tabs/) by using `===`.
For example:

~~~md
=== "Python"

    ```py
    print("Hello world")
    ```

=== "R"

    ```R
    cat("Hello world\n")
    ```

=== "C++"

    ```cpp
    #include <iostream>

    int main() {
        std::cout << "Hello World";
        return 0;
    }
    ```

=== "Shell"

    ```sh
    echo "Hello world"
    ```

=== "Rust"

    ```rust
    fn main() {
        println!("Hello World");
    }
    ```
~~~

produces:

=== "Python"

    ```py
    print("Hello world")
    ```

=== "R"

    ```R
    cat("Hello world\n")
    ```

=== "C++"

    ```cpp
    #include <iostream>

    int main() {
        std::cout << "Hello World";
        return 0;
    }
    ```

=== "Shell"

    ```sh
    echo "Hello world"
    ```

=== "Rust"

    ```rust
    fn main() {
        println!("Hello World");
    }
    ```

## Adding terminal session recordings

You can use [asciinema](https://asciinema.org/) to record a terminal session, and display this recorded session with a small amount of HTML and JavaScript.
For example, the following code is used to display the `where-did-this-line-come-from.cast` recording in a tab called "Video demonstration", as shown in [Where did this line come from?](using-git/where-did-this-line-come-from.md) chapter:

```md
=== "Video demonstration"

    <div id="demo" data-cast-file="../where-did-this-line-come-from.cast"></div>
```

You can also add links that jump to specific times in the video.
Each link must have:

+ A `data-video` attribute that identifies the video (in the example above, this is `"demo"`);
+ A `data-seek-to` attribute that identifies the time (in seconds) to jump to; and
+ A `href` attribute that is set to `"javascript:;"` (so that the link doesn't scroll the page).

For example, the following code is used to display the video recording on the [Choosing your Git Editor](using-git/choosing-your-git-editor.md):

```md
=== "Git editor example"

    <div id="demo" data-cast-file="../git-editor-example.cast"></div>

    Video timeline:

    1. <a data-video="demo" data-seek-to="4" href="javascript:;">Overview</a>
    2. <a data-video="demo" data-seek-to="17" href="javascript:;">Show how to use nano</a>
    3. <a data-video="demo" data-seek-to="71" href="javascript:;">Show how to use vim</a>
```
