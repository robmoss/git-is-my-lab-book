# Incorrect data in a pre-print figure

Author: Rob Moss (`rgmoss@unimelb.edu.au`)

Project: COVID-19 scenario modelling ([public repository](https://bitbucket.org/robmoss/covid19-aus-scenario-model))

## The problem

Our colleague James Trauer notified us that they suspected there was an error in Figure 2 of our COVID-19 scenario modelling [pre-print article](https://doi.org/10.1101/2020.04.07.20056184).
This figure showed model predictions of the daily ICU admission demand in an unmitigated COVID-19 pandemic, and in a COVID-19 pandemic with case targeted public health measures.
I inspected the script responsible for plotting this figure, and confirmed that I had mistakenly plotted the combined demand for ward and ICU beds, instead of the demand for ICU beds alone.

## The solution

This mistake was [simple to correct](https://bitbucket.org/robmoss/covid19-aus-scenario-model/commits/7ed7d45f731e153f72b77b83c81a6a3aac888995), but the obvious concern was whether any other outputs related to ICU bed demand were affected.

We conducted a detailed review of all data analysis scripts and outputs, and confirmed that this error only affected this single manuscript figure.
It had no bearing on the impact of the interventions in each model scenario.
Importantly, it did not affect any of the simulation outputs, summary tables, and/or figures that were included in our reports to government.

The corrected figure can be seen in the [published article](https://doi.org/10.3201/eid2612.202530).

## How version control helped

Because we used version control to record the development history of the model and all of the simulation analyses, we were able to easily inspect the repository state at the time of each prior analysis.
This greatly simplified the review process, and ensured that we were inspecting the code **exactly as it was** when we produced each analysis.
