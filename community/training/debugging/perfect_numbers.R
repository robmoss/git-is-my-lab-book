#!/usr/bin/env -S Rscript --vanilla
#
# This script prints perfect numbers.
#
# Perfect numbers are positive integers that are equal to the sum of their
# divisors.
#


main <- function() {
  start <- 2
  end <- 1000
  for (value in seq.int(start, end)) {
    if (is_perfect(value)) {
      print(value)
    }
  }
}


is_perfect <- function(value) {
  divisors <- divisors_of(value)
  sum(divisors) == value
}


divisors_of <- function(value) {
  divisors <- c()
  candidate <- 2
  while (candidate < value) {
    if (value %% candidate == 0) {
      divisors <- c(divisors, candidate)
    }
    candidate <- candidate + 1
  }
  divisors
}


main()
