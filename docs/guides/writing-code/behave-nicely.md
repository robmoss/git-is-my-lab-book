# Behave nicely

Would you feel comfortable running someone else's code if you thought it might affect your other files, applications, settings, or do something else that's unexpected?

!!! tip

    Your code should be **encapsulated:** it should assume as little as possible about the computer on which it is running, and it shouldn't mess with the user's environment.

!!! tip

    Your code should follow the **principal of least surprise:** behave in a way that most users will expect it to behave, and not astonish or surprise them.

## A cake analogy

Suppose you have two colleagues who regularly bake cakes, and you decide you'd like one of them to bake you a chocolate cake.

- **A nice colleague:**

    - That evening, they go home and bake a cake.
    - They bring the cake to work the next day.
    - The cake tastes of chocolate.

- **A messy colleague:**

    - They bring the ingredients and a portable oven into your office.
    - They make a huge mess, splattering your desk and computer.
    - The oven is noisy and makes the office uncomfortably warm.
    - The cake tastes of vanilla, not chocolate.

## Some specific tips

- Avoid modifying files outside of the project directory!

- Avoid using hard-coded absolute paths, such as `C:\Users\My Name\Some Project\...` or `/Users/My Name/Some other directory`.
  These make it harder for other people to use the code, or to run the code on high-performance computing platforms.

- Prefer using paths that are relative to the root directory of your project, such as `input-data/case-data/cases-for-2023.csv`.
  If you're using R, the [here](https://here.r-lib.org/) package is extremely helpful.

- Warn the user before running tasks that take a long time to complete.

- Notify the user before downloading large files.
