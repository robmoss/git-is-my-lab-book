# When something fails

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

```R linenums="19"
options(error=recover)

g(12)
```
