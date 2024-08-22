# What is debugging?

!!! info

    Debugging is the process of identifying and removing errors from computer software.

You need to **identify (and reproduce) the problem** and **only then** begin fixing it (ideally writing a test case first, to check that (a) you can identify the problem; and (b) to identify if you accidentally introduce the same, or similar, mistake in the future).

## Action 1: Identify the error

!!! tip

    First make sure that you can reproduce the error.

What observations or outputs indicate the presence of this error?

Is the error reproducible, or does it come and go?

Write a failing test?

## Action 2: Develop a plan

!!! tip

    The visible error and its root cause may be located in very different parts of your code.

Identify like and unlikely suspects, what can we rule in/out?
What parts of your code recently changed?
When was the last time you might have noticed this error?

## Action 3: Search for the root cause

!!! tip

    As much as possible, the search should be guided by **facts**, not **assumptions**.

Our assumptions about the code can help us to develop a plan, but we need to verify whether our assumptions are actually true.

For example:

```text
Simple errors can often hide
hide in plain sight and be
surprisingly difficult to
discover without assistance.
```

Thinking "this looks right" is **not a reliable indicator** of whether a piece of code contains an error.

<figure markdown="span">
  ![A horse with its head buried in a haystack.](headless-horse.jpg){ align=left, width="50%" }
  <figcaption markdown="span">Searching at random is like looking for a needle in a haystack.
  <br/>
  ([Perry McKenna](https://flickr.com/photos/63567936@N00/4210167891/), Flickr, 2009; CC BY 2.0)
  </figcaption>
</figure>

Better approaches involve confirming what the code is **actually doing**.

- This can be done using indirect approaches, such as adding print statements or writing test cases.

- It can also be done by directly inspecting the state of the program with a debugger — more on that shortly!

## Action 4: Fix the root cause

!!! tip

    It's worth considering if the root cause is a result of deliberate decisions or unintentional mistakes.

Don't start modifying/adding/removing lines based on suspicions or on the off chance that it might work.
Without identifying the **root cause** of the error, there is no guarantee that making the error seem to disappear will actually have fixed the root cause.

## Action 5: After it's fixed

!!! tip

    This is the perfect time to reflect on your experience!

What can you learn from this experience?
Can you avoid this mistake in the future?
What parts of the process were the hardest or took the longest?
Are the tools and techniques that might help you next time?
