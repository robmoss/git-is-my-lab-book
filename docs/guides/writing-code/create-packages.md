# Create packages

For languages such as R, Python, and Julia, it is generally a good idea to **write your code as a package/library**.
This can make it easier to install and run your code on a new computer, on a high-performance computing platform, and for others to use on their own computers.

!!! info

    This is **a simple process** and entirely separate from **publishing** your package or making it publicly available.

    It also means you can avoid using `source()` in R, or adding directories to `sys.path` in Python.

To create a package you need to provide some necessary information, such as a package name, and the list of the packages that your code depends on ("dependencies").
You can then use packaging tools to **verify** that you've correctly identified these dependencies and that your package can be successfully installed and used!

This is an important step towards **ensuring your work is reproducible**.

There are some great online resources that can help you get started.
We list here some widely-recommended resources for specific languages.

## Writing R packages

For [R](https://www.r-project.org/), see [R Packages (2nd ed)](https://r-pkgs.org/) and the [devtools package](https://devtools.r-lib.org/).

Other useful references include:

- [rOpenSci Packages: Development, Maintenance, and Peer Review](https://devguide.ropensci.org/);
- [Writing an R package from scratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/) by Hilary Parker;
- [How to develop good R packages](https://masalmon.eu/2017/12/11/goodrpackages/) by Maëlle Salmon;
- [Making your first R package](https://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html) by Fong Chun Chan; and
- [Writing an R package from scratch](https://r-mageddon.netlify.app/post/writing-an-r-package-from-scratch/) by Tomas Westlake.


!!! info

    rOpenSci offers [peer review of statistical software](https://stats-devguide.ropensci.org/).

## Writing Python packages

The [Python Packaging User Guide](https://packaging.python.org/en/latest/) provides a tutorial on [Packaging Python Projects](https://packaging.python.org/en/latest/tutorials/packaging-projects/).

Other useful references include:

- The [pyOpenSci project](https://www.pyopensci.org/) also provide a [Python Packaging Guide](https://www.pyopensci.org/python-package-guide/).
  This includes information about [code style, formatting, and linters](https://www.pyopensci.org/python-package-guide/package-structure-code/code-style-linting-format.html).

- This [example Python project](https://gitlab.unimelb.edu.au/rgmoss/example-python-project/) demonstrates one way of structuring a Python project as a package.

!!! info

    pyOpenSci offers [peer review of scientific software](https://www.pyopensci.org/software-peer-review/)

## Writing Julia Packages

The Julia's [package manager documentation](https://pkgdocs.julialang.org/dev/) provides a guide to [Creating Packages](https://pkgdocs.julialang.org/dev/creating-packages/)
