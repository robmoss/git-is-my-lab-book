#!/usr/bin/env -S Rscript --vanilla

options(error = rlang::entrace)


main <- function() {
  do_big_tasks()
  invisible(0)
}

do_big_tasks <- function(num_tasks = 20, quiet = TRUE) {
  for (i in seq_len(num_tasks)) {
    prepare_things(i, quiet = quiet)
    do_first_step(i, quiet = quiet)
    do_second_step(i, quiet = quiet)
    if (i > 15) {
      do_third_step(i, quiet = quiet)
    }
  }
}

prepare_things <- function(task_num, quiet = TRUE) {
  if (!quiet) {
    cat("Preparing for task #", task_num, "\n", sep = "")
  }
}

do_first_step <- function(task_num, quiet = TRUE) {
  if (!quiet) {
    cat("Task #", task_num, ": doing step #1\n", sep = "")
  }
}

do_second_step <- function(task_num, quiet = TRUE) {
  if (!quiet) {
    cat("Task #", task_num, ": doing step #2\n", sep = "")
  }
}

do_third_step <- function(task_num, quiet = TRUE) {
  if (!quiet) {
    cat("Task #", task_num, ": doing step #3\n", sep = "")
  }
  try_something()
}

try_something <- function() {
  stop("Whoops, this failed")
}

if (! interactive()) {
  status <- main()
  quit(status = status)
}
