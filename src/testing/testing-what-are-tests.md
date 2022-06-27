## What are tests for? 

Writing code is complicated and it is near impossible to ensure that it is "bug" free. 
As such, it is your job as a programmer to minimise the number of bugs in your code (hopefully to zero). 
This is where testing your code can help. 


```admonish tip
If you cannot think of a simple test for the function that you just wrote, then it does too much. 
Find the portions of code that you can test and turn them into functions in their own right. 
If all subfunctions are tested and work predictably, you can be confident in the performance of the function. 
```

To ensure that your code works, it is typical to investigate a number of test cases. 
If all the test cases are true than you can be confident that your code is "correct" (not wrong).


```admonish warning
Tests for your code can only find mistakes that you EXPECT.
```

Imagine you had the following piece of code,

```python
def quadratic_formula(a,b,c):
  first = (-b + sqrt(b^2 - 4*a*c))/(2*a)`
  second = (-b - sqrt(b^2 - 4*a*c))/(2*a)
  return [first,second]
```

what tests would you run to ensure that it worked appropriately? 
The most simple way to define a test, is to know the output given the input. 
For the `quadratic_formula` function, we could define the following test. 

```python
def TEST_quadratic_formula():
  output = quadratic_formula(1,2,1)
  return output[0] == -1 & output[1] == -1
```

The function `TEST_quadratic_formula` will return `true` if and only if `quadratic_formula(1,2,1)` returns the correct answer. 
This is a simple example to demonstrate how to test your code. 

```admonish warning
A single test does not ensure that the function works. 
Try and define multiple tests with a wide variety of inputs for complete confidence.
```