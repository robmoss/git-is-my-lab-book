# Perfect numbers

=== "Overview"

    [Perfect numbers](https://en.wikipedia.org/wiki/Perfect_number) are positive integers that are equal to the sum of their divisors.
    Here we have provided example Python and R scripts that should print all of the perfect numbers up to 1,000.

    You can download each script to debug on your own computer:

    - [perfect_numbers.py](perfect_numbers.py)
    - [perfect_numbers.R](perfect_numbers.R)

=== "Python"

    ```py title="perfect_numbers.py" linenums="1"
    --8<-- "perfect_numbers.py"
    ```

=== "R"

    ```R title="perfect_numbers.R" linenums="1"
    --8<-- "perfect_numbers.R"
    ```

??? bug "But there's a problem ..."

    If we run these scripts, we see that **they don't print anything**:

    <div id="demo" data-cast-file="../perfect-numbers-first-run.cast"></div>

    How should we begin investigating?

??? note "Some initial thoughts ..."

    - Are we actually running the `main()` function at all?

    - The `main()` function is almost certainly not the cause of this error.

    - The `is_perfect()` function is very simple, so it's unlikely to be the cause of this error.

    - The `divisors_of()` function doesn't look obviously wrong.

    - But there must be a mistake **somewhere**!

    - Let's **use a debugger** to investigate.
