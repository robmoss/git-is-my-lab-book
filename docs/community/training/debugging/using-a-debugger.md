# Using a debugger

The main features of a debugger are:

- **Breakpoints:** pause the program when a particular line of code is about to be executed;

- **Display/print:** show the current value of local variables;

- **Next:** execute the current line of code and pause at the next line;

- **Continue:** continue executing code until the next breakpoint, or the code finishes.

Slightly more advanced features include:

- **Conditional breakpoints:** pause the program when a particular line of code is about to be executed **and** a specific condition is satisfied.

- **Step:** execute the current line of code and pause at the first possible point — either the line in the current function **or** the first line in a function that is called.

For example, consider the following code example:

=== "Python"

    ```py linenums="1" hl_lines="4"
    def first_function():
        total = 0
        for x in range(1, 50):
            y = second_function(x)
            total = total + y

        return total


    def second_function(a):
        result = 3 * a**2 + 5 * a
        return result


    first_function()
    ```

=== "R"

    ```R linenums="1" hl_lines="4"
    first_function <- function() {
      total <- 0
      for (x in seq(49)) {
        y <- second_function(x)
        total <- total + y
      }
      total
    }

    second_function <- function(a) {
      result <- 3 * a^2 + 5 * a
      result
    }

    first_function()
    ```

- We can use a **conditional breakpoint** to pause on line 4 (highlighted) only when `x = 42`.

- We can then use **step** to begin executing line 4 and pause on line 11, where we will see that `a = 42`.

- If we instead used **next** at line 4 (highlighted), the debugger would execute line 4 and then pause on line 5.

# Using a debugger when your code has an error

We can use a special type of **conditional breakpoint** when our code returns an error: pause the program when a particular line of code that returns an error is about to be executed.

For example, consider the following code example where there is an error:

=== "Python"

    ```py linenums="1" hl_lines="4"
    import sys

    def main(my_numbers):
        do_big_tasks(my_numbers)
        return 0
    
    def do_big_tasks(numbers, quiet=True):
        for number in numbers:
            prepare_things(number, quiet=quiet)
            do_first_step(number, quiet=quiet)
            do_second_step(number, quiet=quiet)
            do_third_step(number, quiet=quiet)
    
    
    def prepare_things(num, quiet=True):
        if not quiet:
            print(f'Preparing for task #{num}')
    
    
    def do_first_step(num, quiet=True):
        if not quiet:
            print(f'Task #{num}: doing step #1')
    
    
    def do_second_step(num, quiet=True):
        if not quiet:
            print(f'Task #{num}: doing step #2')
    
    
    def do_third_step(num, quiet=True):
        if not quiet:
            print(f'Task #{num}: doing step #3')
        try_something(num)
        
    
    def try_something(num):
        if num <= 0:
            raise ValueError("Whoops, this failed")
    
    
    if __name__ == "__main__":
        my_numbers = [341,54, 194,356, 48, 68, 7, 378, 189, 212, 140, 279, 118,
                24, 219,  18, 477,  12, 228, 302,  69, 237, 464, 333, 224, 427,
               321, 181, 290, 416, 431, 362,  94, 455, 165, 456, 132,  99, 488,
                36, 282, 469, 435, 326, 463,  87, 319,  84, 184,  50, 136,  67,
               156, 222, 495, 434,  70, 354, 493, 402, 249, 396, 328, 220, 257,
               253,   4, 373, 494,  43,  28, 420, 400, 305, 450, 226,  37,  86,
               460, 498, 403, 379, 244, 410,  55, 339, 124, 458, 135, 395, 159,
               382,  33, 444, 158, 215,  71, 185,   5, 461, 447, 142, 404,  88,
               343, 351,  59, 216, 479, 358,  11, 474, 478, 131, 258, 394, 301,
               472, 291,  82, 337, 490, 171,  61,   6,  44, 465, 475, 318,  53,
               306, 308, 332,  23, 380, 486, 207, 117, 317, 268, 294, 240, 130,
               162,  21, -25, 199, 281, 274, 492, 206, 112, 322, 365, 250, 363,
               210, 342, 104, 314, 275, 161, 313, 103,  20,  39,  97, 307, 312,
               381, 344, 102, 340, 188, 173, 300, 451, 119, 233, 386, 201,  20,
               470, 442, 230, 376, 417, 163, 468,  74, 129,  65, 208,  73, 439,
               482, 148, 311, 246, 375]
        
        status = main(my_numbers)
        sys.exit(status)
    ```

The traceback tells us that there is a value error when try_something() is executed:

=== "Python"

    ```
    
    Traceback (most recent call last):

      File ~/python_envs/pneu_env/lib/python3.9/site-packages/spyder_kernels/py3compat.py:356 in compat_exec
        exec(code, globals, locals)
    
      File ~/Documents/pneumonia/git_v5/code/varying_transmission/untitled1.py:61
        status = main(my_numbers)
    
      File ~/Documents/pneumonia/git_v5/code/varying_transmission/untitled1.py:5 in main
        do_big_tasks(my_numbers)
    
      File ~/Documents/pneumonia/git_v5/code/varying_transmission/untitled1.py:14 in do_big_tasks
        do_third_step(number, quiet=quiet)
    
      File ~/Documents/pneumonia/git_v5/code/varying_transmission/untitled1.py:35 in do_third_step
        try_something(num)
    
      File ~/Documents/pneumonia/git_v5/code/varying_transmission/untitled1.py:40 in try_something
        raise ValueError("Whoops, this failed")
    
    ValueError: Whoops, this failed
    ```
    
We can use **try-except()** to debug our code just before the error occurs by debugging our code on line 38:

=== "Python"

    ```py linenums="1" hl_lines="4"
    
    import sys


    def main(my_numbers):
        do_big_tasks(my_numbers)
        return 0
    
    
    def do_big_tasks(numbers, quiet=True):
        for number in numbers:
            prepare_things(number, quiet=quiet)
            do_first_step(number, quiet=quiet)
            do_second_step(number, quiet=quiet)
            do_third_step(number, quiet=quiet)
    
    
    def prepare_things(num, quiet=True):
        if not quiet:
            print(f'Preparing for task #{num}')
    
    
    def do_first_step(num, quiet=True):
        if not quiet:
            print(f'Task #{num}: doing step #1')
    
    
    def do_second_step(num, quiet=True):
        if not quiet:
            print(f'Task #{num}: doing step #2')
    
    
    def do_third_step(num, quiet=True):
        if not quiet:
            print(f'Task #{num}: doing step #3')
        try:
            try_something(num)
        except:
            print("try_something returns error with %s"%num)
    
    def try_something(num):
        if num <= 0:
            raise ValueError("Whoops, this failed")
    
    
    if __name__ == "__main__":
        my_numbers = [341,54, 194,356, 48, 68, 7, 378, 189, 212, 140, 279, 118,
                24, 219,  18, 477,  12, 228, 302,  69, 237, 464, 333, 224, 427,
               321, 181, 290, 416, 431, 362,  94, 455, 165, 456, 132,  99, 488,
                36, 282, 469, 435, 326, 463,  87, 319,  84, 184,  50, 136,  67,
               156, 222, 495, 434,  70, 354, 493, 402, 249, 396, 328, 220, 257,
               253,   4, 373, 494,  43,  28, 420, 400, 305, 450, 226,  37,  86,
               460, 498, 403, 379, 244, 410,  55, 339, 124, 458, 135, 395, 159,
               382,  33, 444, 158, 215,  71, 185,   5, 461, 447, 142, 404,  88,
               343, 351,  59, 216, 479, 358,  11, 474, 478, 131, 258, 394, 301,
               472, 291,  82, 337, 490, 171,  61,   6,  44, 465, 475, 318,  53,
               306, 308, 332,  23, 380, 486, 207, 117, 317, 268, 294, 240, 130,
               162,  21, -25, 199, 281, 274, 492, 206, 112, 322, 365, 250, 363,
               210, 342, 104, 314, 275, 161, 313, 103,  20,  39,  97, 307, 312,
               381, 344, 102, 340, 188, 173, 300, 451, 119, 233, 386, 201,  20,
               470, 442, 230, 376, 417, 163, 468,  74, 129,  65, 208,  73, 439,
               482, 148, 311, 246, 375]
        
        status = main(my_numbers)
        sys.exit(status)
    ```
