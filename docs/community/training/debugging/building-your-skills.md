# Building your skills

!!! tip

    Whenever you debug some code, consider it as an opportunity to learn, reflect, and [build your debugging skills](manifesto.md).

    Pay attention to your experience — what worked well, and what would you do differently next time?

## Identifying errors

Write a failing test case, this allows you to verify that the bug can be reproduced.

## Developing a plan

What information might help you decide how to begin?

Can you identify a recent "known good" version of the code that doesn't include the error?

If you're using version control, have a look at your recent commits and check whether any of them are likely to have introduced or exposed this error.

## Searching for the root cause

We've shown how a debugger allows you to pause your code and see what it's actually doing.
This is extremely helpful!

!!! tip

    Other approaches may be useful, but avoid using trial-and-error.

To quickly confirm or rule out specific suspicions, you might consider using:

- `print()` statements;
- using `assert()` to verify whether specific conditions are met;
- manually calling functions from an interactive session (a "[REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)");
- reverting or commenting out the most recent changes; or
- using `git bisect` to [identify the commit](../../../guides/using-git/where-did-this-problem-come-from.md) that introduced the error.

## Fixing the root cause

Is there an optimal solution?

This might be the solution that changes as little code as possible, or it might be a solution that involves modifying and/or restructuring other parts of your code.

## After it's fixed

If you didn't write a test case to identify the error (see above), now is the time to write a test case to ensure you don't even make the same error again.

Are there other parts of your code where you might make a similar mistake, for which you could also write test cases?

Are there coding practices that might make this kind of error easier to find next time?
For example, this might involve dividing your code into smaller functions, using version control to record commits [early and often](../../../guides/version-control/what-should-I-commit.md).

Have you considered defensive programming practices?
For example, at the start of a function it can often be a good idea to check that all of the arguments have valid values.

Are there tools or approaches that you haven't used before, and which might be worth trying next time?
