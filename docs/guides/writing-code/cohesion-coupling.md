# Cohesion and coupling

**Divide your code** into modules, each of which does one thing ("high cohesion") and depends as little as possible on other pieces ("low coupling").

## Common project components

For example, an infectious diseases modelling project might often be divided into some of the following components:

- The model parameters — what are their values or prior distributions?

- The initial model state — how is this created from the model parameters?

- The model equations or update rules — how does the model evolve over time?

- Summary statistics — what do you want to record for each simulation?
  This might be the entire state history, a subset of the history, some aggregate statistics, or any combination of these things.

- The input data (if any) — these may be case data, serological data, within-host specimen counts, etc.

- The relationship between data and the model state ("observation model").

- Simulated data generated from a model simulation.

As much as possible, each of these components (where relevant to your project) should be represented as **a separate piece of code**.

## Separating the "what" from the "how"

Dividing your code into separate components is especially important if you want to use a model for multiple purposes, such as:

- Exploring different scenarios;
- Fitting to various data sets;
- Performing sensitivity and uncertainty analyses; and
- Forecasting future data.

!!! tip

    In particular, keep the following aspects of your project separate:

    - **What to do:** fitting to different data sets, exploring different scenarios, performing a sensitivity analysis, etc; and

    - **How to do it:** the model implementation.

    If you want to explore a range of model scenarios, for example, define the parameter values (or sampling distributions) for each scenario in a separate input file.
    Then write a script that takes an input file name as an argument, reads the parameter values, and uses these values to run the model simulations.

    This makes it extremely simple to define and run new scenarios without modifying your code.

## Interactions between components

Choosing how your components interact (e.g., by calling functions or passing data) is **just as important** as deciding how to divide your code into components.

Here are some key recommendations from [Object-Oriented Software Construction (2nd ed)](https://bertrandmeyer.com/OOSC2/):

- Small interfaces: if two modules communicate, they should exchange as little information as possible.

- Explicit interfaces: if two modules communicate, it should be obvious from the code in one or both of these modules.

- Self documentation: strive to make all information about a module part of the module itself.
