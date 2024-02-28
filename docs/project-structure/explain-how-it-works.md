# Explain how it all works

Once you've chosen a project structure, you need to write down **how it all works** — regardless of how simple and clear your project structure is!

!!! tip

    The best place to do this is in a `README.md` file (or equivalent) in the project root directory.

Begin with an overview of the project:

- What question(s) are you trying to address?

- What data, hypotheses, methods, etc, are you using?

- What outputs does this generate?

You can then provide further detail, such as:

- What software environment and/or packages must be available for your code to run?

- How can the user generate each of the outputs?

- What license [have you chosen](../using-git/choosing-a-license.md)?


## An example README.md

See the [Australian 2020 COVID-19 forecasts repository](https://gitlab.unimelb.edu.au/rgmoss/aus-2020-covid-forecasts) for an example `README.md` file.

This repository was used to generate the results, tables, and figures presented in the paper "[Forecasting COVID-19 activity in Australia to support pandemic response: May to October 2020](https://doi.org/10.1038/s41598-023-35668-6)", *Scientific Reports* 13, 8763 (2023).

**Strengths:**

- It includes installation and usage instructions;

- It identifies the paper; and

- It identifies the license under which the code is distributed.

**Weaknesses:**

- It only explains some of the project structure.

- It doesn't provide an overview of the project, it only links to the paper.

- The root directory contains a number of scripts and input files that aren't described.
