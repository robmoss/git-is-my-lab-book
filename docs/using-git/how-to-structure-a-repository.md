# How to structure a repository

While there is no single "best" way to structure a repository, there are some guidelines that you can follow.
The key aims are to ensure that your files are logically organised, and that others can easily navigate the repository.

## Divide your repository into multiple directories

It is generally a good idea to have separate directories for different types of files.
For example, your repository might contain any of these different file types, and you should at least consider storing each of them in a separate directory:

- Input data files (which you may have received from a collaborator);
- Cleaned and/or processed input files (e.g., if you aggregate the input data before using it);
- Data analysis code;
- Simulation/model code;
- Output data files;
- Plotting scripts that extract results from the output data files;
- Output figures produced by the plotting scripts; and
- Manuscript text and bibliography files.

## Use descriptive names for directories and files

Choosing file names that indicate what each file/directory contains can help other people, such as your collaborators, navigate your repository.
They can also **help you** when you return to a project after several weeks or months.

!!! tip

    Have you ever asked yourself "where is the file that contains X"?

    Use descriptive file names, and the answer might be right in front of you!

## Include a `README` file

You can write this in Markdown (`README.md`), in plain text (`README` or `README.txt`), or in any other suitable format.
For example, Python projects often use reStructuredText and have a `README.rst` file.

This file should begin with a brief description of **why** the repository was created and **what** it contains.

Importantly, this file should also mention:

- How the files and directories are arranged.
  Help your collaborators understand where they need to look in order to find something.

- How to run important pieces of code (e.g., to generate output data files or figures).

- The software packages and/or libraries that are required run any of the code in this repository.

- The [license](choosing-a-license.md) (if any) under which the repository contents are being made available.
