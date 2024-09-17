# What is debugging?

!!! info

    Debugging is the process of identifying and removing errors from computer software.

You need to **identify (and reproduce) the problem** and **only then** begin fixing it.

## Action 1: Identify the error

!!! tip

    First make sure that you can reproduce the error.

- What observations or outputs indicate the presence of this error?

- Is the error reproducible, or does it come and go?

- Can you write a test case that identifies the error?
  This can help ensure you don't introduce a similar error in the future.

## Action 2: Develop a plan

!!! tip

    The visible error and its root cause may be located in very different parts of your code.

- Identify which parts of your code are likely (and unlikely) to be the cause.

- What parts of your code recently changed?

- When was the last time you might have noticed this error?

## Action 3: Search for the root cause

!!! tip

    The search should be guided by **facts**, not **assumptions**.
    Simple errors can often hide **in plain sight**.

- Thinking "this looks right" is **not a reliable indicator** of whether a piece of code contains an error.

- Our assumptions about the code can help us to develop a plan, but we need to **verify whether our assumptions are actually true**.

- This can be done indirectly by adding print statements or writing test cases.

- It can also be done by directly inspecting the state of the program with a debugger — more on that shortly!

<figure markdown="span">
  ![A horse with its head buried in a haystack.](headless-horse.jpg){ align=left, width="50%" }
  <figcaption markdown="span">Searching at random is like looking for a needle in a haystack.
  <br/>
  ([Perry McKenna](https://flickr.com/photos/63567936@N00/4210167891/), Flickr, 2009; CC BY 2.0)
  </figcaption>
</figure>

## Action 4: Fix the root cause

!!! tip

    It's worth considering if the root cause is a result of deliberate decisions or unintentional mistakes.

- Don't start modifying/adding/removing lines based on suspicions or relying on luck.

- Without identifying the **root cause**, making the visible error disappear may not fix the root cause.

## Action 5: After it's fixed

!!! tip

    This is the perfect time to reflect on your experience!

- What can you learn from this experience?

- Can you avoid this mistake in the future?

- What parts of the process were the hardest or took the longest?

- Are the tools and techniques that might help you next time?
