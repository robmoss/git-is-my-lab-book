# Test Runners
A test runner is the piece of code that runs your testing suite! 
Everytime you call the test runner, the corresponding testing suite runs and returns which tests passed and failed. 
These test runners can typically take inputs from the terminal and run specific subsets of tests. 
This is helpful if you do not want to run all tests (large codebases may take an inordinate amount of time to finish all unit tests).

The main reason to ensure that you have test runners is for [Continuous integration](../collaborating/continuous-integration.md) (CI).
It is possible to set up a git repository where everytime code is pushed the testing suite is run. 
Depending upon the output of the testing suite, different events can be triggered. 
For example, upon successful completion of all tests the branch could be merged into master. 
