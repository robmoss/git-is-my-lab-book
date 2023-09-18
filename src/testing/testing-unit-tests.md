# Unit Tests

A unit test is used to ensure that one "unit" of code is working as desired (That sounds familiar... check out [What should I commit?](../version-control/what-should-I-commit.md). 
It should be obvious that unit testing and commiting work go hand in hand! When should you commit? When you have a unit of work. 
When should you unit test? When you have a unit of work. 
If you really want to ensure that your code is working, decide upon all tests that your new code must pass BEFORE developing your code.
In the software engineering community this leads to [test driven development](testing-test-driven-development.md). 

Unit tests most commonly check that a single function is working in the desired way. 
They are by definition cheap to evaluate and simple to run (run time measured in seconds at worst). 
There should be no complicated state space changes. 

```admonish tip
As unit tests are so cheap, they should be run constantly and used to ensure that there are no unpredictable artifacts from your new functions!
```
