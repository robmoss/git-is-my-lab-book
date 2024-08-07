# Automate common tasks

If you reach the point where you need to run a specific sequence of commands or actions to achieve something — e.g., running a model simulation, or producing an output figure — it is a **very good idea** to write a script that performs all of these actions correctly.

This is because while you may remember exactly what needs to be done **right now**, you may not remember next week, or next month, or next year.
We're all human, and we all make mistakes, but these kinds of mistakes are **easy to avoid**!

!!! info

    Mistakes are a fact of life. It is the response to the error that counts.

    — Nikki Giovanni

There are many tools that can help you to automate tasks, some of which are smart enough that they will only do as little as possible (e.g., avoid re-running steps if the inputs have not changed).

There are popular tools aimed at specific programming languages, such as:

- **R:** [targets](https://books.ropensci.org/targets/);

- **Python**: [nox](https://nox.thea.codes/) and [tox](https://tox.wiki/); and

- **Julia:** [pipelines](https://juliapackages.com/p/pipelines).

There are many generic automation tools (see, e.g., Wikipedia's list of [build automation software](https://en.wikipedia.org/wiki/List_of_build_automation_software)), although these can be rather complex to learn.
We recommend using a language-specific automation tool where possible, and only using a generic automation tool as a last resort.
