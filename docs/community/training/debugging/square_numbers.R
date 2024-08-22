#!/usr/bin/env -S Rscript --vanilla
#
# Print the square numbers between 1 and 100.
#


main <- function() {
  squares <- find_squares(1, 100)
  print(squares)
}


find_squares <- function(lower_bound, upper_bound) {
  squares <- c()
  value <- lower_bound
  while (value <= upper_bound) {
    if (is_square(value)) {
      squares <- c(squares, value)
    }
    value <- value + 1
  }
  squares
}


is_square <- function(value) {
  for (i in seq(value)) {
    if (i * i == value) {
      return(TRUE)
    }
  }
  FALSE
}

if (! interactive()) {
  main()
}
