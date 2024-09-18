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

??? example "A real-world example"

    Last week (Tues 17 Sep, 2024) I encountered an error when running model simulations with my [pypfilt](https://pypfilt.readthedocs.io/) Python library.
    I used the breakpoint technique described above, and identified the cause in **less than 2 minutes**.

    Here is the original stack trace that made me aware of the error:

    ```text linenums="1" hl_lines="11"
    Traceback (most recent call last):
      File "./run_model_simulations.py", line 633, in <module>
      File "./run_model_simulations.py", line 56, in main
        results = run_simulations(
      File "./run_model_simulations.py", line 283, in run_epidefend_by_age
        return extract_results_tables(ctx, results)
      File "venv/lib/python3.10/site-packages/pypfilt/__init__.py", line 536, in fit
        ctx.component['summary'].save_forecasts(ctx, results, filepath)
      File "venv/lib/python3.10/site-packages/pypfilt/summary.py", line 1523, in save_forecasts
        save_data(obs_group, key, value)
      File "venv/lib/python3.10/site-packages/pypfilt/summary.py", line 1467, in save_data
        raise ValueError(
    ValueError: Error saving dataset "00_to_04" with value [...] and type ndarray
    ```

    The error occurred on **line 1467** (highlighted above).
    This [piece of code](https://gitlab.unimelb.edu.au/rgmoss/particle-filter-for-python/-/blob/ada50f970e7787d97605dc11ed228640b0c72e1d/src/pypfilt/summary.py#L1458-L1469) looks like:

    ```python linenums="1458"
    try:
        if isinstance(value, np.ndarray):
            save_dataset(time_scale, g, name, value, **kwargs)
        else:
            g.create_dataset(name, data=value, **kwargs)
    except TypeError:
        msg = (
            'Error saving dataset "{}" with value {} and type {}'
        )
        raise ValueError(
            msg.format(name, value, type(value).__name__)
        ) from None
    ```

    So I added a `breakpoint()` call on line 1464 and ran the simulations again:

    ```python linenums="1458" hl_lines="7"
    try:
        if isinstance(value, np.ndarray):
            save_dataset(time_scale, g, name, value, **kwargs)
        else:
            g.create_dataset(name, data=value, **kwargs)
    except TypeError:
        breakpoint()
        msg = (
            'Error saving dataset "{}" with value {} and type {}'
        )
        raise ValueError(
            msg.format(name, value, type(value).__name__)
        ) from None
    ```

    - I observed that `value` was a NumPy array.

    - This meant that `isintance(value, np.ndarray)` was true.

    - So the `save_dataset()` function on line 1460 was failing.

    - I called `save_dataset()` and stepped into the function.

    - This allowed me to **identify the cause:**

        - When the `value` array was created, it originally had columns called `"arrival_date"` and `"count"`;

        - The `"arrival_date"` column contains date values;

        - Dates must be converted into strings when saving data as a HDF5 dataset;

        - Metadata was attached to the `value` array, to indicate how to convert `"arrival_date"` values;

        - But then the columns were then renamed to `"time"` and `"value"`;

        - The metadata **was not updated**, so the `"time"` values were not converted into strings; and

        - This caused `save_dataset()` to fail.

    Here is the [faulty code](https://gitlab.unimelb.edu.au/rgmoss/particle-filter-for-python/-/blob/ada50f970e7787d97605dc11ed228640b0c72e1d/src/pypfilt/obs.py#L450-L462) (in a different file!):

    ```python linenums="450" hl_lines="4-12"
    # Load the data table.
    fields = [io.time_field(time_col), (value_col, np.float64)]
    df = io.read_fields(time_scale, filename, fields)
    # Rename the columns to 'time' and 'value'.
    rename_to = {
        time_col: 'time',
        value_col: 'value',
    }
    new_names = tuple(
        rename_to.get(name, name) for name in df.dtype.names
    )
    df.dtype.names = new_names
    return df
    ```

    And here is [the fix](https://gitlab.unimelb.edu.au/rgmoss/particle-filter-for-python/-/commit/5463da78fe6a2dc41267575b12a72aa5a00d232c):

    ```python linenums="450" hl_lines="4-7"
    # Load the data table.
    fields = [io.time_field(time_col), (value_col, np.float64)]
    df = io.read_fields(time_scale, filename, fields)
    # Rename the columns to 'time' and 'value', and ensure that the dtype
    # metadata is updated to reflect the renamed columns.
    fields_out = [io.time_field('time'), ('value', np.float64)]
    dtype_out = io.fields_dtype(time_scale, fields_out)
    return df.astype(dtype_out)
    ```
