# Document your code

Writing clear, well-structured code, can make it easier for someone to understand what your code does.
You might think that this means your code is so clear and obvious that it needs no further explanation.

But this is not true!
There is **always** a role for writing comments and documentation.
By itself, your code cannot always explain:

- **What** goal you are trying to achieve;

- **How** you are achieving this goal; and

- **Why** you've chosen this approach.

!!! question

    What can you do to make your code more easily understandable?

## Naming

Use good names for functions, parameters, and variables.
This can be **deceptively hard**.

!!! quote

    There are only two hard things in Computer Science: cache invalidation and naming things.

    — Phil Karlton

## Explaining

Have you explained the **intention** of your code?

!!! tip

    Good comments don't say **what the code does**; instead, they **explain why** the code does what it does.

For each function, write a comment that explains what the function does, describes the purpose of each parameter, and describes what values the function returns (if any).

## Documenting

Many programming languages support "docstrings".
These are usually comments with additional structure and formatting, and can be used to automatically generate documentation:

- **R:** [roxygen2](https://roxygen2.r-lib.org/)

- **Python:** there are [several formats](http://web.archive.org/web/20230128071653/http://daouzli.com/blog/docstring.html)

- **Julia:** [Writing Documentation](https://docs.julialang.org/en/v1/manual/documentation/)

See the CodeRefinery [In-code documentation](https://coderefinery.github.io/documentation/in-code-documentation/#what-are-docstrings-and-how-can-they-be-useful) lesson for some good examples of docstrings.

## Commenting out code

Avoid commenting out code.
If it's no longer useful, delete it and save this as a commit!
Make sure you write a helpful commit message.
You can always recover the deleted code if you need it later.
