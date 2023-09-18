# Testing suites

When developing test cases for you code, it makes sense to bundle groups of tests into the one suite.
For example, tests on a specific class or function may be bundled into the one suite. 
The benefit of using suites is that testing frameworks typically allow you to specify which suite of tests to run. 
If you are designing code for a class, it may not make sense to test code that has been stable for years. 
In which case, it would be wise to run code from the new specific suite. 

Example using GoogleTest, unittest, and an R version.