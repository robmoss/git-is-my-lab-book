# Fixing a bug in pypfilt

Author: Rob Moss (`rgmoss@unimelb.edu.au`)

Project: [pypfilt], a bootstrap particle filter for Python

Date: 27 October 2021

## Overview

I introduced a bug when I modified a function in my [pypfilt] package, and only detected the bug after I had created several more commits.

To resolve this bug, I had to:

1. Notice the bug;

2. Identify the cause of the bug;

3. Write a test case to check whether the bug is present; and

4. Fix the bug.

## Notice the bug

I noticed that a regression test[^regression] was failing: re-running a set of model simulations was no longer generating the same output.
The results had changed, but none of my recent commits should have had this effect.

**I should have noticed this** when I created the commit that introduced this bug, but:

- I had not pushed the most recent commits to the upstream [repository], where all of the test cases are run automatically every time a new commit is pushed; and

- I had not run the test cases on my laptop after making each of the recent commits, because this takes a few minutes and I was lazy.

## Identify the cause of the bug

I knew that the bug had been introduced quite recently, and I knew that it affected a specific function: [earlier_states()].
Running `git blame src/pypfilt/state.py` indicated that the recent commit [408b5f1] was a likely culprit, because it changed many lines in this function.

In particular, I suspected the bug was occurring in the following loop, which steps backwards in time and handles the case where model simulations are reordered:

```python
# Start with the parent indices for the current particles, which allow us
# to look back one time-step.
parent_ixs = np.copy(hist['prev_ix'][ix])

# Continue looking back one time-step, and only update the parent indices
# at time-step T if the particles were resampled at time-step T+1.
for i in range(1, steps):
    step_ix = ix - i
    if hist['resampled'][step_ix + 1, 0]:
        parent_ixs = hist['prev_ix'][step_ix, parent_ixs]
```

In stepping through this code, I identified that the following line was incorrect:


```python
    if hist['resampled'][step_ix + 1, 0]:
```

and that changing `step_ix + 1` to `step_ix` **should** fix the bug.

**Note:** I could have used `git bisect` to identify the commit that introduced this bug, but running all of the test cases for each commit is relatively time-consuming; since I knew that the bug had been introduced quite recently, I chose to use `git blame`.

## Write a test case

I wrote a test case [test_earlier_state()] that called this [earlier_states()] function a number of times, and checked that each set of model simulations were returned in the correct order.

This test case checks that:

1. If the model simulations were not reordered, the original ordering is always returned;

2. If the model simulations were reordered at some time `t_0`, the original ordering is returned for times `t < t_0`; and

3. If the model simulations were reordered at some time `t_0`, the new ordering is returned for times `t >= t_0`.

This test case failed when I reran the testing pipeline, which indicated that it identified the bug.

## Fix the bug

With the test case now written, I was able to verify that that changing `step_ix + 1` to `step_ix` **did** fix the bug.

I added the test case and the bug fix in commit [9dcf621].

In the commit message I indicated:

1. Where the bug was located: the [earlier_states()] function;

2. When the bug was introduced: commit [408b5f1]; and

3. Why the bug was not detected when I created commit [408b5f1].

[^regression]: A regression test checks that a commit hasn't changed an existing behaviour or functionality.

[pypfilt]: https://pypfilt.readthedocs.io/
[earlier_states()]: https://pypfilt.readthedocs.io/en/latest/api/state.html#pypfilt.state.earlier_states
[repository]: https://gitlab.unimelb.edu.au/rgmoss/particle-filter-for-python
[408b5f1]: https://gitlab.unimelb.edu.au/rgmoss/particle-filter-for-python/-/commit/408b5f13302e5edb5ae7866286927873ed0f0c96
[test_earlier_state()]: https://gitlab.unimelb.edu.au/rgmoss/particle-filter-for-python/-/blob/9dcf621618fe76281a486af7bfba364e7bd26c13/tests/test_earlier_state.py
[9dcf621]: https://gitlab.unimelb.edu.au/rgmoss/particle-filter-for-python/-/commit/9dcf621618fe76281a486af7bfba364e7bd26c13
