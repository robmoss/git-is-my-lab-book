# Useful resources

## Education and commentary articles

- [A Beginner's Guide to Conducting Reproducible Research](https://doi.org/10.1002/bes2.1801) describes key requirements for producing reproducible research outputs.

- [Why code rusts](http://www.tdda.info/why-code-rusts) collects together some of reasons the behaviour of code changes over time.

- [Point of View: How open science helps researchers succeed](https://doi.org/10.7554/eLife.16800) presents evidence that open research practices bring significant benefits to researchers.

- The Journal of Statistics and Data Science Education published a [special issue: Teaching Reproducibility](https://www.tandfonline.com/toc/ujse21/30/3?nav=tocList) in November 2022.
  Also see the presentations from an [invited paper session](https://github.com/ttimbers/jsm2023-teaching-reproducibility-and-responsible-workflow):

    - **Collaborative writing workflows:** building blocks towards reproducibility

    - **Opinionated practices for teaching reproducibility:** motivation, guided instruction, and practice

    - **From teaching to practice:** Insights from the Toronto Reproducibility Conferences

    - **Teaching reproducibility and responsible workflow:** an editor's perspective

## How to structure your project?

- [A Quick Guide to Organizing Computational Biology Projects](https://doi.org/10.1371/journal.pcbi.1000424) suggests an approach for structuring a computational research repository.

- The [TIER Protocol 4.0](https://www.projecttier.org/tier-protocol/protocol-4-0/#%3A~%3Atext%3DFlexibility%20and%20Adaptability%20of%20the%20TIER%20Protocol) provides a template for organising the contents and reproduction documentation for projects that involve working with statistical data:

    > Documentation that meets the specifications of the TIER Protocol contains all the data, scripts, and supporting information necessary to enable you, your instructor, or an interested third party to reproduce all the computations necessary to generate the results you present in the report you write about your project.

- [A simple kit to use computational notebooks for more openness, reproducibility, and productivity in research](https://doi.org/10.1371/journal.pcbi.1010356) provides some good recommendations for organising a project repository and setting up a reproducible workflow using computational notebooks.

## Using Git and other software tools

- NDP Software have created [an interactive Git cheat-sheet](https://ndpsoftware.com/git-cheatsheet.html) that shows how git commands interact with the local and upstream repositories, and provides brief documentation for many common examples.

- The Pro Git book is [available online](https://git-scm.com/book).
  It starts with an overview of Git basics and then covers every aspect of Git in great detail.

- The Software Carpentry Foundation publishes [many lessons](https://software-carpentry.org/lessons/), including [Version Control with Git](https://swcarpentry.github.io/git-novice/).

- [A Quick Introduction to Version Control with Git and GitHub](https://doi.org/10.1371/journal.pcbi.1004668) provides a short guide to using Git and GitHub.
  It presents an example of analysing publicly available ChIP-seq data with Python.
  The repository for the article is also [publicly available](https://github.com/jdblischak/git-for-science).

## Examples of making models publicly available

- [CoMo Consortium App](https://comomodel.net/): the COVID-19 International Modelling Consortium (CoMo) has developed a [Shiny](https://shiny.posit.co/) web application for an age-structured, compartmental SEIRS model.

- [Mastering Shiny](https://mastering-shiny.org/): an online book that teaches how to create web applications with R and Shiny.

## Performing peer code review

- [The Art of Giving and Receiving Code Reviews (Gracefully)](https://www.alexandra-hill.com/2018/06/25/the-art-of-giving-and-receiving-code-reviews/)

- [Code Review in the Lab](https://ropensci.org/blog/2018/11/29/codereview/)

- [Scientific Code Review](https://uwescience.github.io/neuroinformatics/2017/10/08/code-review.html)

- [The 5 Golden Rules of Code Review](https://www.semasoftware.com/blog/the-5-golden-rules-of-code-reviews)

## Continuous Integration (CI) examples

- [GitHub Actions for Python](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-python): the GitHub Actions documentation includes examples of building and testing Python projects.

- [Building reproducible analytical pipelines with R](https://raps-with-r.dev/ci_cd.html): this article shows how to use GitHub Actions to run R code when you push new commits to a GitHub repository.

- [GitHub Actions for the R language](https://github.com/r-lib/actions): this repository provides a variety of GitHub actions for R projects, such as installing specific versions of R and R packages.

- See the [GitHub actions](https://github.com/robmoss/git-is-my-lab-book/tree/master/.github/workflows) for **Git is my lab book**.
  The [build action](https://github.com/robmoss/git-is-my-lab-book/blob/master/.github/workflows/build.yml) does the following:

    1. Check out the repository with [`actions/checkout`](https://github.com/actions/checkout);

    2. Install Python with [`actions/setup-python`](https://github.com/actions/setup-python);

    3. Install [Zensical](https://zensical.org/) and other required tools, as listed in [`requirements.txt`](https://github.com/robmoss/git-is-my-lab-book/blob/master/requirements.txt); and

    4. Build the HTML version of this book with [`zensical`](https://zensical.org/).

## High-performance computing platforms

- [How to access the ARDC Nectar Research Cloud](https://ardc.edu.au/services/nectar-research-cloud/how-to-access-the-ardc-nectar-research-cloud/)

- [Melbourne Research Cloud](https://docs.cloud.unimelb.edu.au/)

- [High Performance Computing at University of Melbourne](https://dashboard.hpc.unimelb.edu.au/)

## How to acknowledge and cite research software

- The [ARDC Guide to making software citable](https://doi.org/10.5281/zenodo.5003989) explains how to cite your code and assign it a DOI.

- [Recognizing the value
of software: a software citation guide](https://doi.org/10.12688/f1000research.26932.2) provides further examples and guidance for ensuring your work receives proper attribution and credit.

## Software licensing

- [Choose an open source license](https://choosealicense.com/) provides advice for selecting an appropriate license that meets your needs.

- [A Quick Guide to Software Licensing for the Scientist-Programmer](https://doi.org/10.1371/journal.pcbi.1002598) explains the various types of available licenses and provides advice for selecting a suitable license.
