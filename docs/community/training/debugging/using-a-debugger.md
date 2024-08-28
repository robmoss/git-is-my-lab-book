# Using a debugger

The main features of a debugger are:

- **Breakpoints:** pause the program when a particular line of code is about to be executed;

- **Display/print:** show the current value of local variables;

- **Next:** execute the current line of code and pause at the next line;

- **Continue:** continue executing code until the next breakpoint, or the code finishes.

Slightly more advanced features include:

- **Conditional breakpoints:** pause the program when a particular line of code is about to be executed **and** a specific condition is satisfied.

- **Step:** execute the current line of code and pause at the first possible point — either the line in the current function **or** the first line in a function that is called.

For example, consider the following code example:

=== "Python"

    ```py linenums="1" hl_lines="4"
    def first_function():
        total = 0
        for x in range(1, 50):
            y = second_function(x)
            total = total + y

        return total


    def second_function(a):
        result = 3 * a**2 + 5 * a
        return result


    first_function()
    ```

=== "R"

    ```R linenums="1" hl_lines="4"
    first_function <- function() {
      total <- 0
      for (x in seq(49)) {
        y <- second_function(x)
        total <- total + y
      }
      total
    }

    second_function <- function(a) {
      result <- 3 * a^2 + 5 * a
      result
    }

    first_function()
    ```

- We can use a **conditional breakpoint** to pause on line 4 (highlighted) only when `x = 42`.

- We can then use **step** to begin executing line 4 and pause on line 11, where we will see that `a = 42`.

- If we instead used **next** at line 4 (highlighted), the debugger would execute line 4 and then pause on line 5.
