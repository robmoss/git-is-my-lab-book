#!/usr/bin/env python3

import sys


def main():
    do_big_tasks()
    return 0


def do_big_tasks(num_tasks=20, quiet=True):
    for i in range(num_tasks):
        prepare_things(i, quiet=quiet)
        do_first_step(i, quiet=quiet)
        do_second_step(i, quiet=quiet)
        if i > 15:
            do_third_step(i, quiet=quiet)


def prepare_things(task_num, quiet=True):
    if not quiet:
        print(f'Preparing for task #{task_num}')


def do_first_step(task_num, quiet=True):
    if not quiet:
        print(f'Task #{task_num}: doing step #1')


def do_second_step(task_num, quiet=True):
    if not quiet:
        print(f'Task #{task_num}: doing step #2')


def do_third_step(task_num, quiet=True):
    if not quiet:
        print(f'Task #{task_num}: doing step #3')
    try_something()


def try_something():
    raise ValueError("Whoops, this failed")


if __name__ == "__main__":
    status = main()
    sys.exit(status)
