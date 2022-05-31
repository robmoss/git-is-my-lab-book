# Collaborating on a paper

Once you are comfortable with creating commits, working in branches, and merging branches, you can use these skills to **write papers collaboratively as a team**.
This approach is particularly useful if you are writing a paper in LaTeX.

Here are some general guidelines that you may find useful:

- Divide the paper into [separate LaTeX files](https://www.overleaf.com/learn/latex/Management_in_a_large_project) for each section.

- Use [tags](../using-git/how-to-create-and-use-tags.md) to identify milestones such as draft versions and revisions.

- Consider creating a [separate branch](sharing-a-branch.md) for each collaborator.

  - Merge these branches when completing a major draft or revision.

- Use [latexdiff](https://www.overleaf.com/learn/latex/Articles/Using_Latexdiff_For_Marking_Changes_To_Tex_Documents) to show tracked changes between the current version and a previous commit/tag:

  ```sh
  latexdiff-git --flatten -r tag-name paper.tex
  ```

- Collaborators who will provide feedback, rather than contributing directly to the writing process, can do this by:

  - Annotating PDF versions of the paper; or
  - Providing comments in response to a [merge/pull request](merge-pull-requests.md).
