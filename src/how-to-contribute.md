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

This book is written in Markdown and is published using [mdBook](https://rust-lang.github.io/mdBook/).
You can suggest modifications and new content by:

- Forking [the book repository](https://github.com/robmoss/git-is-my-lab-book);

- Adding, deleting, and/or modifying book chapters in the `src/` directory;

- Recording your changes in one or more git commits; and

- [Creating a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request), so that we can review your suggestions.

```admonish info
You can also edit any page by clicking the "Suggest an edit" button (<i class="fa fa-edit"></i>) in the top-right corner.
This will start the process described above by forking the book repository.
```

```admonish tip
When editing Markdown content, please **start each sentence on a separate line**.
Also check that your text editor **removes trailing whitespace**.

This ensures that each commit will contain only the modified sentences, and makes it easier to inspect the repository history.
```

## Adding tabbed code blocks

You can display multiple code blocks as a tabbed group by enclosing them in a `<div class="tabbed-blocks"> ... </div>` container.
For example:

~~~md
<div class="tabbed-blocks">

```python
print("Hello world")
```

```R
cat("Hello world\n")
```

```cpp
#include <iostream>

int main() {
    std::cout << "Hello World";
    return 0;
}
```

```sh
echo "Hello world"
```

```rust
fn main() {
    println!("Hello World");
}
```

</div>
~~~

produces:

<div class="tabbed-blocks">

```python
print("Hello world")
```

```R
cat("Hello world\n")
```

```cpp
#include <iostream>

int main() {
    std::cout << "Hello World";
    return 0;
}
```

```sh
echo "Hello world"
```

```rust
fn main() {
    println!("Hello World");
}
```

</div>

## Adding terminal session recordings

You can use [asciinema](https://asciinema.org/) to record a terminal session, and display this recorded session with a small amount of HTML and JavaScript.
For example, the following code is used to display the `where-did-this-line-come-from.cast` recording in a tab called "Video demonstration", as shown in [Where did this line come from?](using-git/where-did-this-line-come-from.md) chapter:

~~~md
<div class="tabbed-blocks">

<div class="tabbed-block" data-tab-title="Video demonstration">
  <div id="demo" data-cast-file="where-did-this-line-come-from.cast"></div>
</div>

</div>
~~~

You can also add links that jump to specific times in the video.
Each link must have:

+ A `data-video` attribute that identifies the video (in the example above, this is `"demo"`);
+ A `data-seek-to` attribute that identifies the time (in seconds) to jump to; and
+ A `href` attribute that is set to `"javascript:;"` (so that the link doesn't scroll the page).

For example, the following example adds links that jump to 15 and 30 seconds into the video:

~~~md
<div class="tabbed-blocks">

<div class="tabbed-block" data-tab-title="Video demonstration">
  <div id="demo" data-cast-file="where-did-this-line-come-from.cast"></div>

  Video timeline:
  <ol>
    <li><a data-video="demo" data-seek-to="15" href="javascript:;">First link</a></li>
    <li><a data-video="demo" data-seek-to="30" href="javascript:;">Second link</a></li>
  </ol>
</div>

</div>
~~~
