# Define your workflow

A good first step in deciding how to structure a project is to ask yourself:

- What are the different project phases?

- What are the major activities in each phase?

## An example of phases and activities

For example, a project might involve the following phases:

1. Clean an existing data set;

2. Build models with different hypotheses or features;

3. Fit each model to the data; and

4. Decide which model best explains the data.

The data-cleaning phase might involve the following activities:

- Obtain the raw data;

- Identify the quality checks that should be applied;

- Decide how to resolve data that fail each quality check; and

- Generate and record the cleaned data.

The model-building phase might involve the following activities:

- Perform a literature search to identify relevant modelling studies;

- Identify competing hypotheses or features that might explain the data;

- Design a model that implements each hypothesis; and

- Define the relationship between each model and the cleaned data.

## Reflect this workflow in your project structure

You can use the phases and activities to guide your choice of directory structure.
For this example project, one possible structure is:

- `project/`: the root directory of your project

    - `input/`: a sub-directory that contains input data;

        - `raw/`: the raw data **before** cleaning;

        - `cleaned/`: the cleaned data;

    - `code/`: a sub-directory that contains the project code;

        - `cleaning/`: the data cleaning code;

        - `model-first-hypothesis/`: the first model;

        - `model-second-hypothesis/`: the second model;

        - `fitting/`: the code that fits each model to the data;

        - `evaluation/`: the code the compares the model fits;

        - `plotting/`: the code that plots output figures;

    - `paper/`: a sub-directory for the project manuscript;

        - `figures/`: the output figures;
