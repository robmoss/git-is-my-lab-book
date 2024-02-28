# Introduction

These materials aim to support
early- and mid-career researchers (EMCRs) in the
[SPECTRUM](https://www.spectrum.edu.au/) and [SPARK](https://www.spark.edu.au/) networks to develop their computing skills, and to make effective use of available tools[^tools] and infrastructure[^infra].

## Motivation

!!! question

    Why dedicate time and effort to learning these skills?
    There are **many reasons!**

The overall aim of these materials is help you conduct code-driven research **more efficiently** and with **greater confidence**.

Hopefully some of the following reasons resonate with you.

- **Fearlessly modify your code**, knowing that your past work is never lost, by using [version control](./version-control/README.md).

- **Verify that your code behaves as expected**, and get notified when it doesn't, by [writing tests](./testing/README.md).

- **Ensure that your results won't change** when running on a different computer by "baking in" [reproducibility](./reproducibility/README.md).

- **Improve your coding skills**, and those of your colleagues, by working [collaboratively](./collaborating/README.md) and making use of [peer code review](./collaborating/peer-code-review.md).

- **Run your code quickly**, and without relying on your own laptop or computer, by using [high-performance computing](./high-performance-computing/README.md).

!!! tip "Foundations of effective research"

    A piece of code is often useful beyond a single project or study.

    By applying the above skills in your research, you will be able to easily reproduce past results, extend your code to address new questions and problems, and allow others to build on your code in their own research.

    **The benefits of good practices can continue to pay off long after the project is finished**.

## The FAIR Guiding Principles

Published in 2016, [The FAIR Guiding Principles for scientific data management and stewardship](https://doi.org/10.1038/sdata.2016.18) proposed guidelines for making valuable scientific outputs "FAIR": Findable, Accessible, Interoperable, and Reusable.

The principles were originally developed for, and applied to, research data.
The FAIR for Research Software (FAIR4RS) Working Group has adapted these principles to create [the FAIR Principles for Research Software](https://doi.org/10.1038/s41597-022-01710-x).
Of particular relevance to these materials is the fourth FAIR4RS principle:

!!! info "FAIR4RS Principle: Reusable"

    Software is both usable (can be executed) and reusable (**can be understood, modified, built upon, or incorporated into other software**).

## Structure

These materials are divided into the following sections:

1. Understanding [version control](./version-control/README.md), which provides you with a complete and annotated history of your work, and with powerful ways to search and examine this history.

2. Learning to use [Git](./using-git/README.md), the most widely used version control system, which is the foundation of popular code-hosting services such as [GitHub](https://github.com/), [GitLab](https://gitlab.com/public), and [Bitbucket](https://bitbucket.org/).

3. Using Git to [collaborate with colleagues](./collaborating/README.md) in a precisely controlled and manageable way.

4. Ensuring that your research is [reproducible by others](./reproducibility/README.md).

5. Using [testing frameworks](./testing/README.md) to verify that your code behaves as intended, and to automatically detect when you introduce a bug or mistake into your code.

6. Running your code on various [computing platforms]() that allow you to obtain results efficiently and without relying on your own laptop/computer.

7. [Case studies](./case-studies/README.md) where EMCRs showcase how their research activities are enabled and/or supported by these tools.

8. We are organising a [Community of Practice](./community/README.md) that will act as a living curriculum, and will use this section to record the findings and outputs of our community activities.

## How to contribute

If you have any comments, feedback, or suggestions, please see the [How to contribute](how-to-contribute.md) page.

## License

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

[^tools]: Such as [version control](./version-control/README.md) and [testing frameworks](./testing/README.md).

[^infra]: Such as the [ARDC Nectar Research Cloud][nectar] and [Spartan].

[nectar]: https://ardc.edu.au/services/nectar-research-cloud/
[Spartan]: https://dashboard.hpc.unimelb.edu.au/
