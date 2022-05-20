# Testing Frameworks 

When developing your own tests, you have two options. The first, write your own testing framework (environment) or use a framework developed by someone else. In this section we introduce the terminology and structures that are used in two popular testing frameworks, unittest (python) and googletest (C++).

# Test Case 
A test case is the simplest component of a testing framework to understand. This is the "test". Implementation details may change, but to put it simply, this is a function that runs some portion of your code and checks the output. These test cases will return a boolean for success or failure. 

There are multiple different types of test cases that one should consider when writing code. A test case may check the equality of a known output with a given input or could even test failure (death test).

It is common for tests to be named  `TEST_*`. Provided below is an example of how the `__init__` function of a python class might be unit tested.  

```python
class Student:
  def __init__(self, name, age):
    self.name = name
    self.age  = age

def TEST_student_init():
  student = Student("Rob",12)
  assert student.name == "Rob"
  assert student.age == 12
```

Whilst this is a trivial example, it highlights how unit testing should be developed. The `Student` class is initialised by providing the name and age of the student. By writing the `TEST_student_init()` function, we are asserting that the initialiser must set the name and age appropriately. Why is this important? As the code develops we may alter the `__init__` function and break assumed functionality. For example, 

```python
class Student:
  def __init__(self, name, age):
    name = "Eamon"
    self.name = name
    self.age  = age

def TEST_student_init():
  student = Student("Rob",12)
  assert student.name == "Rob"
  assert student.age == 12
```

will know break the `TEST_student_init()` test case that we put in place. 