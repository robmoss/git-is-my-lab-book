# Testing stochastic models

There are two main approaches for testing non-deterministic functions. 
The first involves testing the statistical properties of the function and the second involves using controlled randomness. 

Testing the statistical properties of a function is perfectly acceptable to validate its correctness. 
For example, we may wish to write a function that samples from the multivariate normal distribution. 
A simple way to test this function is to run it repeatedly, tracking the mean and covariance. 
If after a suitably large number of trials you can reproduce the known mean and covariance, we can assume the function passes the test. 
These tests are inherently "fuzzy" as you are not guaranteed to reproduce results exactly. 
These tests are inherently slow(er), as you must repeat the function call to ensure that you have enough trials. 

The second approach to testing a statistical function is to use controlled randomness. 
For any good random number generator you should be able to set the seed.
This will result in reproducible outputs from the generator. 
Given this controlled randomness, you can now design a test that will work with a known sequence of random numbers. 

This approach is not foolproof, a known and reproducible sequence of random numbers may just avoid the part of your function that is bugged.
Therefore, consider using multiple seed points and ensure that you test all edge cases of your stochastic functions. 