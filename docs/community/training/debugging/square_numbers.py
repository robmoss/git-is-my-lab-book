#!/usr/bin/env python3
"""
Print the square numbers between 1 and 100.
"""


def main():
    squares = find_squares(1, 100)
    print(squares)


def find_squares(lower_bound, upper_bound):
    squares = []
    value = lower_bound
    while value <= upper_bound:
        if is_square(value):
            squares.append(value)
        value += 1
    return squares


def is_square(value):
    for i in range(1, value + 1):
        if i * i == value:
            return True
    return False


if __name__ == '__main__':
    main()
