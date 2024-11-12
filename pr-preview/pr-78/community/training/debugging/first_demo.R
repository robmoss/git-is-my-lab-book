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

total <- first_function()
cat("Total =", total, "\n")
