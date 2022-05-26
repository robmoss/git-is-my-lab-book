# Peer code review

Once you're comfortable in using [merge/pull requests](merge-pull-requests.md) to review changes in a branch, you can use this approach for peer code review.

```admonish info
Remember that code review is a **discussion and critique** of a person's work.
The code author will naturally feel that they own the code, and the reviewer needs to respect this.
```

For further advice and suggestions on how to conduct peer code review, please see the [Performing peer code review](../references.md#performing-peer-code-review) references.

## Define the goals of a peer review

In creating a pull request and inviting someone to review your work, the pull request description should include the following details:

- An overview of the work included in the pull request: what have you done, why have you done it?

- You may also want to explain how this work fits into the broader context of your research project.

- Identify **specific questions or tasks** that you would like the reviewer to address.
  For example, you might ask the reviewer to address one or more of the following questions:

  - Can the reviewer run your code and reproduce the outputs?

  - Is the code easy to understand?

  - If you have a [style guide](coding-style-guides.md), is the code formatted appropriately?

  - Do the model equation or data analysis steps seem sensible?

  - If you have written documentation, is it easy to understand?

  - Can the reviewer suggest how to improve or rewrite a specific piece of code?

```admonish tip
Make the reviewer's job easier by giving them small amounts of code to review.
```

## Guidelines for reviewing other people's code

Peer code review is an opportunity for the author and the reviewer to **learn from each other** and improve a piece of code.

```admonish tip
The most important guideline for the reviewer is to **be kind**.

Treat other people's code the way you would want them to treat your code.
```

- [**Avoid saying "you"**](https://www.alexandra-hill.com/2018/06/25/the-art-of-giving-and-receiving-code-reviews/).
  Instead, say "we" or make the code the subject of the sentence.

  - Don't say "You don't have a test for this function", but instead say "We should test this function".

  - Don't say "Why did you write it this way?", but instead say "What are the advantages of this approach?".

- **Ask questions** rather than stating criticisms.

  - Don't say "This code is unclear", but instead say "Can you help me understand how this code works?".

- Treat peer review as an opportunity to **praise good work**!

  - Don't be afraid to tell the author that a piece of code was very clear, easy to understand, or well written.

  - Tell the author if reading their code made you aware of a useful function or package.

  - Tell the author if reading their code gave you some ideas for your own code.

## Complete the review

Once the peer code review is complete, and any corresponding updates to the code have been made, you can [merge the branch](merge-pull-requests.md).

## Retain a record of the review

By using merge/pull requests to review code, the discussion between the author and the reviewer is recorded.
This can be a useful reference for future code reviews.

```admonish tip
Try to record all of the discussion in the pull request comments, even if the author and reviewer meet in person, so that you have a complete record of the review.
```
