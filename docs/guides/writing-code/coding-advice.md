# Coding advice

- Think about how to cleanly structure your code.
  Take a **similar approach to how we write papers and grants**.

- Break the overall problem into pieces, and then decide how to structure each piece in turn.

- Divide your code into functions that each do one "thing", and group related functions into separate files or modules.

- It can sometimes help to think about how you want the final code to look, and then design the functions and components that are needed.

- Avoid global variables, aim to pass everything as function arguments.
  This makes the code more robust and easier to run.

- Avoid passing lots of individual parameters as separate arguments, this is prone to error — you might not pass them in the correct order.
  Instead, collect the parameters into a single structure (e.g, a Python dictionary, an R named list).

- Avoid making multiple copies of a model if you want to change some aspect of its behaviour.
  Instead, add a new model parameter that enables/disables this new behaviour.
  This allows you to use the same code to run the older and newer versions of the model.

- Try to collect common or related tasks into a single script, and allow the user to select which task(s) to run, rather than creating many scripts that perform very similar tasks.

- Write test cases to check key model properties.

    - You want to identify problems and mistakes as soon as possible!

    - Thinking about how to make your code testable can help you improve its structure!

    - Well-written tests can also demonstrate **how to use your code**!
