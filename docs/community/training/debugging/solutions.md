# Exercise solutions

## Perfect numbers

Perfect numbers are equal to the sum of their proper divisors — all divisors except the number itself.

For example, 6 is a perfect number.
Its proper divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.

The mistake here is that  the `divisors_of()` function only returns divisors **greater than one**, and so the code fails to identify any of the true perfect numbers.

Interestingly, this mistake did not result in the code mistakenly identifying any other numbers as perfect numbers.

## Python vs R

If you're only familiar with one of these two languages, you may be surprised to discover that they have some fundamental differences.
In this exercise we demonstrated one consequence of the ways that these languages handle function arguments.

!!! quote "The R Language Definition"

    The semantics of invoking a function in R argument are **call-by-value**.
    In general, supplied arguments behave as if they are **local variables** initialized with the value supplied and the name of the corresponding formal argument.
    Changing the value of a supplied argument within a function **will not affect** the value of the variable in the calling frame.

    — [Argument Evaluation](https://cran.r-project.org/doc/manuals/r-patched/R-lang.html#Argument-evaluation)

!!! quote "Python Programming FAQ"

    Remember that arguments are **passed by assignment** in Python.
    Since assignment just **creates references** to objects, there's no alias between an argument name in the caller and callee, and so no call-by-reference per se.

    — [How do I write a function with output parameters (call by reference)?](https://docs.python.org/3/faq/programming.html#how-do-i-write-a-function-with-output-parameters-call-by-reference)

- In R the `run_model_scaled_beta()` and `run_model_scaled_gamma()` functions **do not modify** the value of `settings` in the `demonstration()` function.
  This produces model outputs for the following parameter combinations:

    - β = 1.0 and γ = 0.5;
    - β = 1.5 and γ = 0.5; and
    - **β = 1.0 and γ = 0.35**.

- In Python the `run_model_scaled_beta()` and `run_model_scaled_gamma()` functions **do modify** the value of `settings` in the `demonstration()` function.
  This produces model outputs for the following parameter combinations:

    - β = 1.0 and γ = 0.5;
    - β = 1.5 and γ = 0.5; and
    - **β = 1.5 and γ = 0.35**.

!!! success "Answer"

    The value of β is different in the third combination.
