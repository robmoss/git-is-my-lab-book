# Using a debugger

The main features of a debugger are:

- **Breakpoints:** pause the program when a particular line of code is about to be executed;

- **Display/print:** show the current value of local variables;

- **Next:** execute the current line of code and pause at the next line;

- **Continue:** continue executing code until the next breakpoint, or the code finishes.

Slightly more advanced features include:

- **Conditional breakpoints:** pause the program when a particular line of code is about to be executed **and** a specific condition is satisfied.

- **Step:** execute the current line of code and pause at the first possible point — either the line in the current function **or** the first line in a function that is called.

- **Manual breakpoints:** call [`breakpoint()`](https://docs.python.org/3/library/pdb.html) in Python, and [`browser()`](https://adv-r.hadley.nz/debugging.html#browser) in R, to pause the program at the current line.

For example, consider the following code example:

=== "Python"

    ```py title="first_demo.py" linenums="1" hl_lines="4"
    --8<-- "first_demo.py"
    ```

=== "R"

    ```R title="first_demo.R" linenums="1" hl_lines="4"
    --8<-- "first_demo.R"
    ```

- We can use a **conditional breakpoint** to pause on line 4 (highlighted) only when `x = 42`.

- We can then use **step** to begin executing line 4 and pause on line 11, where we will see that `a = 42`.

- If we instead used **next** at line 4 (highlighted), the debugger would execute line 4 and then pause on line 5.

## Try this yourself

Download either demo script and try setting breakpoints and stepping through the code.

- [first_demo.py](first_demo.py)
- [first_demo.R](first_demo.R)

!!! tip "Interactive debugger sessions"

    If your editor supports running a debugger, **use this feature!**
    See these examples for [RStudio](https://support.posit.co/hc/en-us/articles/205612627-Debugging-with-the-RStudio-IDE), [PyCharm](https://www.jetbrains.com/pycharm/features/debugger.html), [Spyder](https://docs.spyder-ide.org/current/panes/debugging.html), and [VS Code](https://code.visualstudio.com/docs/editor/debugging).

## Creating breakpoints when something fails

You may want to create a breakpoint when an error occurs.

In Python, you can use a `try` statement to catch exceptions and create a breakpoint:

```py linenums="1" hl_lines="8"
def print_c(data):
    print(data['c'])

x = {'a': 1, 'b': 2}
try:
    print_c(x)
except KeyError:
    breakpoint()
```

In R, you can take a similar approach and use `tryCatch()`:

```R linenums="1" hl_lines="12"
f <- function(x) {
  if (x == 10) { stop("ten") }
  x
}

g <- function(x_max) {
  result <- tryCatch(
    sapply(seq_len(x_max), f),
    error = function(e) NULL
  )
  if (is.null(result)) {
    browser()
  }
  result
}

g(9)  # This completes without an error.
g(12) # This triggers the breakpoint.
```

In R, you can also define a global error handler (e.g., `browser` or `recover`):

```R
options(error=recover)

g(12)
```
