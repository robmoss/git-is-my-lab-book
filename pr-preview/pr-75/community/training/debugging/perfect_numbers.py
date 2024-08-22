#!/usr/bin/env python3
"""
This script prints perfect numbers.

Perfect numbers are positive integers that are equal to the sum of their
divisors.
"""


def main():
    start = 2
    end = 1_000
    for value in range(start, end + 1):
        if is_perfect(value):
            print(value)


def is_perfect(value):
    divisors = divisors_of(value)
    return sum(divisors) == value


def divisors_of(value):
    divisors = []
    candidate = 2
    while candidate < value:
        if value % candidate == 0:
            divisors.append(candidate)
        candidate += 1
    return divisors


if __name__ == '__main__':
    main()
