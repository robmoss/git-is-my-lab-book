# Test Fixture 
Use the same data for multiple tests!

Let us now extend past our simple `Student` class example! As your code base develops, it is likely that your classes will not just consist of member variables. 

```python
class Square:
  def __init__(self,length):
    self.length = length

  def area():
    return length*length 
  
  def perimeter():
    return 4*length
```
In the above code example we have defined the `Square` class. 
Unlike the `Student` class it has extra functionality, including both an `area()` and `perimeter()` member function. 
Lets write a simple test for the initialisation of the class.

```python
def TEST_Square_init():
  square = Square(4.0)
  assert(square.length == 4.0)
```
In this function we are checking that the `Square` class initialises as expected.
If we wanted to test the additional functionality of the `Square` class, we could add extra assertions to the `TEST_Square_init()` function. 
```python
def TEST_Square_init():
  square = Square(4.0)
  assert(square.length == 4.0)
  assert(square.perimeter()==4*4.0)
  assert(square.area()== 4.0*4.0)
```
However, now the name of the test is misleading. We are not just testing the `__init__()` function of the class. Therefore, we should create new tests!

```python
def TEST_Square_init():
  square = Square(4.0)
  assert(square.length == 4.0)

def TEST_Square_area():
  square = Square(4.0)
  assert(square.perimeter()==4*4.0)

def TEST_Square_perimeter():
  square = Square(4.0)
  assert(square.perimeter()==4*4.0)
```

Wait... there is a lot of redundant code here. 
In each test we had to recreate the square object to test the member functions.
Whilst this might not be a problem for the small class that we have created, it could pose a dramatic problem for classes that require a large amount of work to initialise!
This is where Test Fixtures come in. 
A fixture is a state that will be common to a suite of tests. 