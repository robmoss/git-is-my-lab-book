# Understanding error messages

!!! tip

    The visible error and its root cause may be located in very different parts of your code.

If there's an error in your code that causes the program to terminate, **read the error message** and see what it can tell you.

Most of the time, the error message should allow you to identify:

- **What went wrong?**
  For example, did it try to read data from a file that does not exist?

- **Where did this happen?**
  On which line of which file did the error occur?

## Stack traces

When an error occurs, one useful piece of information is knowing which functions were called in order to make the error occur.

Below we have example Python and R scripts that produce an error.

!!! question

    Can you identify where the error occurred, just by looking at the error message?

!!! tip

    R may not give you a useful stack trace unless you instruct it do so.
    In the example, we use:

    ```R
    options(error = rlang::entrace)
    ```

=== "Overview"

    You can download each script and run them on your own computer:

    - [stacktrace.py](stacktrace.py)
    - [stacktrace.R](stacktrace.R)

=== "Python"

    The error message is:

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

    The error message is:

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

## Very long stack traces

You may get a very long stack trace when a error occurs deep within a software package or library.
This means that the **cause** of the error, and location where the error is **reported** can be very far apart.

For example, the following Python script has an incorrect parameter name on line 7 (``cbap`` should instead be ``cmap``):

```py title="long_stacktrace.py" linenums="1" hl_lines="7"
--8<-- "long_stacktrace.py"
```

And here is the stacktrace you should see when running this Python script:

```text linenums="1" hl_lines="3 24"
Traceback (most recent call last):
  File "long_stacktrace.py", line 7, in <module>
    plt.plot(example_counts, cbap=cm.Blues)
  File "venv/lib/python3.10/site-packages/matplotlib/pyplot.py", line 3794, in plot
    return gca().plot(
  File "venv/lib/python3.10/site-packages/matplotlib/axes/_axes.py", line 1779, in plot
    lines = [*self._get_lines(self, *args, data=data, **kwargs)]
  File "venv/lib/python3.10/site-packages/matplotlib/axes/_base.py", line 296, in __call__
    yield from self._plot_args(
  File "venv/lib/python3.10/site-packages/matplotlib/axes/_base.py", line 534, in _plot_args
    return [l[0] for l in result]
  File "venv/lib/python3.10/site-packages/matplotlib/axes/_base.py", line 534, in <listcomp>
    return [l[0] for l in result]
  File "venv/lib/python3.10/site-packages/matplotlib/axes/_base.py", line 527, in <genexpr>
    result = (make_artist(axes, x[:, j % ncx], y[:, j % ncy], kw,
  File "venv/lib/python3.10/site-packages/matplotlib/axes/_base.py", line 335, in _makeline
    seg = mlines.Line2D(x, y, **kw)
  File "venv/lib/python3.10/site-packages/matplotlib/lines.py", line 407, in __init__
    self._internal_update(kwargs)
  File "venv/lib/python3.10/site-packages/matplotlib/artist.py", line 1216, in _internal_update
    return self._update_props(
  File "venv/lib/python3.10/site-packages/matplotlib/artist.py", line 1190, in _update_props
    raise AttributeError(
AttributeError: Line2D.set() got an unexpected keyword argument 'cbap'
```

While it **does** tell you the cause of the error, there are **ten function calls** between the root cause (line 3 of the stack trace) and the error (line 24 of the stack trace).
