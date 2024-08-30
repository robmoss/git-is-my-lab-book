# Understanding error messages

!!! tip

    The visible error and its root cause may be located in very different parts of your code.

If there's an error in your code that causes the program to terminate, **read the error message** and see what it can tell you.

Most of the time, the error message should allow to identify:

- **What went wrong?**
  For example, did it try to read data from a file that does not exist?

- **Where did this happen?**
  On which line of which file did the error occur?

## Stack traces

When an error occurs, one useful piece of information is knowing which functions were called in order to make the error occur.

Below we have example Python and R scripts that produce an error.

!!! question

    Can you identify where the error occurred, just by looking at the error message?

=== "Overview"

    You can download each script and run them on your own computer:

    - [stacktrace.py](stacktrace.py)
    - [stacktrace.R](stacktrace.R)


=== "Python"

    ### The error message

    ```text
    Traceback (most recent call last):
      File "stacktrace.py", line 46, in <module>
        status = main()
      File "stacktrace.py", line 7, in main
        do_big_tasks()
      File "stacktrace.py", line 17, in do_big_tasks
        do_third_step(i, quiet=quiet)
      File "stacktrace.py", line 38, in do_third_step
        try_something()
      File "stacktrace.py", line 42, in try_something
        raise ValueError("Whoops, this failed")
    ValueError: Whoops, this failed
    ```

    ??? info "Source code"

        ```py title="stacktrace.py" linenums="1"
        --8<-- "stacktrace.py"
        ```

=== "R"

    ### The error message

    ```text
    Error in try_something() : Whoops, this failed
    Calls: main -> do_big_tasks -> do_third_step -> try_something
    Backtrace:
        ▆
     1. └─global main()
     2.   └─global do_big_tasks()
     3.     └─global do_third_step(i, quiet = quiet)
     4.       └─global try_something()
    Execution halted
    ```

    ??? info "Source code"

        ```R title="stacktrace.R" linenums="1"
        --8<-- "stacktrace.R"
        ```
