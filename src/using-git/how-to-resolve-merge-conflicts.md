# How to resolve merge conflicts?

A merge conflict can occur when we try to merge one branch into another, if the two branches introduce any conflicting changes.

For example, consider trying to merge two branches that make the following changes to the same line of the file `test.txt`:

1. On the branch `my-new-branch`:
   ```diff
    First line
   -Second line
   +My new second line
    Third line
   ```

2. On the main branch:
   ```diff
    First line
   -Second line
   +A different second line
    Third line
   ```

When we attempt to merge `my-new-branch` into the main branch, `git merge my-new-branch` will tell us:

```text
Auto-merging test.txt
CONFLICT (content): Merge conflict in test.txt
Automatic merge failed; fix conflicts and then commit the result.
```

The `test.txt` file will now include the conflicting changes, which we can inspect with `git diff`:

```diff
diff --cc test.txt
index 18712c4,bc576a6..0000000
--- a/test.txt
+++ b/test.txt
@@@ -1,3 -1,3 +1,7 @@@
  First line
++<<<<<<< ours
 +A different second line
++=======
+ My new second line
++>>>>>>> theirs
  Third line
```

Note that this two-day diff shows:

1. "our" changes: from the commits on the branch that we are **merging into**; and
2. "their" changes: from the commits on the branch that we are **merging from**.

Each conflict is surrounded by `<<<<<<<` and `>>>>>>>` markers, and the conflicting changes are separated by a `=======` marker.

## Resolving the conflicts

We can edit `test.txt` to reconcile these changes, and the commit our fix.
For example, we might decide that `test.txt` should have the following contents:

```text
First line
The corrected second line
Third line
```

We can then commit these changes to resolve the merge conflict:

```sh
git add test.txt
git commit -m "Resolved the merge conflict"
```

## Cancelling the merge

Alternatively, you may decide you don't want to merge these two branches, in which case you cancel the merge by running:

```sh
git merge --abort
```
