# Exercise: Python vs R

=== "Overview"

    Here we have provided SIR ODE model implementations in Python and in R.
    Each script runs several scenarios and produces a plot of infection prevalence for each scenario.

    You can download each script to debug on your computer:

    - [sir_ode.py](sir_ode.py)
    - [sir_ode.R](sir_ode.R)

=== "Python"

    ```py title="sir_ode.py" linenums="1"
    --8<-- "sir_ode.py"
    ```

=== "R"

    ```R title="sir_ode.R" linenums="1"
    --8<-- "sir_ode.R"
    ```

!!! bug "The model outputs differ!"

    Here are prevalence time-series plots produced by each script:

    === "Python plot"

        <figure markdown="span">
          ![Python outputs](sir_ode_python.png)
          <figcaption>Model outputs for the Python script.</figcaption>
        </figure>

    === "R plot"

        <figure markdown="span">
          ![R outputs](sir_ode_r.png)
          <figcaption>Model outputs for the R script.</figcaption>
        </figure>

!!! tip "Interactive debugger sessions"

    If your editor supports running a debugger, **use this feature!**
    See these examples for [RStudio](https://support.posit.co/hc/en-us/articles/205612627-Debugging-with-the-RStudio-IDE), [PyCharm](https://www.jetbrains.com/pycharm/features/debugger.html), [Spyder](https://docs.spyder-ide.org/current/panes/debugging.html), and [VS Code](https://code.visualstudio.com/docs/editor/debugging).

??? note "Some initial thoughts ..."

    - Is it obvious whether one of the figures is correct and the other is wrong?

    - The `sir_rhs()` functions in the two scripts appear to be equivalent — but are they?

    - The `default_settings()` functions appear to be equivalent — but are they?

    - The `run_model_scaled_beta()` and `run_model_scaled_gamma()` functions also appear to be equivalent.

    - Where might you begin looking?
