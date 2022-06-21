

# Test driven development. 

All functions should have simplifications that you can test.
For example, we might require the evaluation of a first order derivative in our code.Lets call this function `derivative` (we will not decide upon inputs yet).
We decide that the best way to implement the derivative is to use a first order finite difference, namely,

\\[ f'(x) = \lim_{h\rightarrow 0}\frac{f(x+h)-f(x)}{h} + \mathcal{O}(h).\\]

But before we start, how can we test our code? 
Well, we know that if

\\[f(x) = ax +b\\]

than our first order derivative function will be exact.
Therefore, we could check if the return value of `derivative` should be `a` if `f = ax+b`.
This will also be true for all values of `h` and `x`!
This is wonderful, we have our first test case.

```
f = 0.1*x + 0.1
assert(derivative(f)==0.1)
```

Oh, we should probably include `x` in our derivative function, otherwise our function will have to return another function as the output. 

```
f = 0.1*x + 0.1
assert(derivative(f,x)==0.1)
```

Notice how that we knew a test case, and in trying to develop for this test case we learnt more about the inputs we should use. 

Are there any problems with this type of unit test? 
  - Floating point operations are not exact!
    - We can fix this with using binary representations. 
    - Fuzzy compare is not the answer. 

Remember that your unit tests are only as good as the individual that writes them.
It is good practice to seek help in determining what tests your code will pass.
A session with the wider team to brainstorm could be very helpful to make sure that code is sutiably tested. If you do not realise that something is a bug, how can you test it!

Building software is a complicated process that is always riddled with bugs. 
Test driven development is one approach to ensure that your code is "free" of bugs.
If it is decided that a new function should be created, think, what test cases can we use to ensure that this function does what we expect? 

# Links of interest
[Stepping Through the Looking Glass: Test-Driven Game Development (Part 1)](https://gamesfromwithin.com/stepping-through-the-looking-glass-test-driven-game-development-part-1)

