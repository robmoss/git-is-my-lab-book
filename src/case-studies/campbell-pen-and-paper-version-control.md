# Pen and paper - a less user-friendly form of version control than Git

Author: Trish Campbell (`patricia.campbell@unimelb.edu.au`)

Project: Pertussis modelling

## The problem

In this project, I developed a compartmental model of pertussis to determine appropriate vaccination strategies.
While plotting some single model simulations, I noticed anomalies in the modelled output for two experiments.
The first experiment had an order of magnitude more people in the infectious compartments than in the second experiment, even though there seemed to be far fewer infections occurring.
This scenario did not fit with the parameter values that were being used.
In the differential equation file for my model, in addition to extracting the state of the model (i.e. the population in each compartment at each time step), for ease of analysis I also extracted the cumulative number of infections up to that time step.
The calculation for this extraction of cumulative incidence was incorrect.

## The solution

The error occurred because susceptible people in my model were not all equally susceptible, and I failed to account for this when I calculated the cumulative number of infections at each time step.
I identified that this was the problem by running some targeted test parameter sets and observing the changes in model output.
The next step was to find out how long this bug had existed in the code and which analyses had been affected.
While I was using version control, I tended to make large infrequent commits.
I did, however, keep extensive hand-written notes in lab books, which played the role of a detailed history of commits.
Searching through my historical lab books, I identified that I had introduced this bug into the code two years earlier.
I was able to determine which parts of my results would have been affected by the bug and made the decision that all experiments needed to be re-run.

## How version control helped

Using a **pen and paper** form of version control enabled me to pinpoint the introduction of the error and identify the affected analyses, but it was a tedious process.
While keeping an immaculate record of changes that I had made was invaluable, imagine how much simpler and faster the process would have been if I had been a regular user of an electronic version control system such as Git! 
