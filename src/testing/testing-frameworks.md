# Testing Frameworks 

When developing your own tests, you have two options. The first, write your own testing framework (environment) or use a framework developed by someone else. In this section we introduce the terminology and structures that are used in two popular testing frameworks, unittest (python) and googletest (C++).

# Test Case 
A test case is the simplest component of a testing framework to understand. This is the "test". Implementation details may change, but to put it simply, this is a function that runs some portion of your code and checks the output. These test cases will return a boolean for success or failure. 

There are multiple different types of test cases that one should consider when writing code. A test case may check the equality of a known output with a given input or could even test failure (death test).

