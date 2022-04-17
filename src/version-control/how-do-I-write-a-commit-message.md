# How do I write a commit message?

Commit messages are shown as part of the repository history (e.g., when running `git log`).
Each message consists of a short one-line description, followed by as much or as little text as required.

You should treat these messages as **entries in a log book**.
Explain what changes were made and **why** they were made.
This can help collaborators understand what we have done, but more importantly is acts as a record for our future selves.

*Have you ever looked at code you wrote a long time ago, and wondered what you were thinking?*

A history of detailed commit messages should answer this!

For example, rather than writing:

> Added model

You could write something like:

> Implemented the initial model
>
> This model includes all of the core features that we need to fit the data,
> but there several other features that we intend to add:
>
> - Parameter X is currently constant, but we may need to allow it to vary
>   over time;
>
> - Parameter Y should probably be a hyperparameter; and
>
> - The population includes age-structured mixing, but we need to also include
>   age-specific outcomes, even though there is very little data to suggest
>   what the age effects might be.
