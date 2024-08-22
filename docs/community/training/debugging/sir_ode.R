#!/usr/bin/env -S Rscript --vanilla

library(deSolve)
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))


# The right-hand side for the vanilla SIR compartmental model.
sir_rhs <- function(time, state, params) {
  s_to_i <- params$beta * state["I"] * state["S"] / params$popn
  i_to_r <- params$gamma * state["I"]
  list(c(-s_to_i, s_to_i - i_to_r, i_to_r))
}


# Return the SIR ODE solution for the given model settings.
run_model <- function(settings) {
  # Define the time span and evaluation times.
  times <- seq(0, settings$sim_days)
  # Define the initial state.
  popn <- settings$population
  exposures <- settings$exposures
  initial_state <- c(S = popn - exposures, I = exposures, R = 0)
  # Define the SIR parameters.
  params <- list(
    popn = settings$population,
    beta = settings$beta,
    gamma = settings$gamma
  )
  # Return the daily number of people in S, I, and R.
  ode(initial_state, times, sir_rhs, params)
}


# The default model settings.
default_settings <- function() {
  list(
    sim_days = 20,
    population = 100,
    exposures = 2,
    beta = 1.0,
    gamma = 0.5
  )
}


# Adjust the value of ``beta`` before running the model.
run_model_scaled_beta <- function(settings, scale) {
  settings$beta <- scale  * settings$beta
  run_model(settings)
}


# Adjust the value of ``gamma`` before running the model.
run_model_scaled_gamma <- function(settings, scale) {
  settings$gamma <- scale * settings$gamma
  run_model(settings)
}


# Plot daily prevalence of infectious individuals for one or more scenarios.
plot_prevalence_time_series <- function(solutions) {
  df <- lapply(
    names(solutions),
    function(name) {
      solutions[[name]] |>
        as.data.frame() |>
        mutate(scenario = name)
    }
  ) |>
    bind_rows() |>
    mutate(
      scenario = factor(scenario, levels = names(solutions), ordered = TRUE)
    )
  fig <- ggplot() +
    geom_line(aes(time, I), df) +
    xlab(NULL) +
    scale_y_continuous(
      name = NULL,
      limits = c(0, 40),
      breaks = c(0, 20, 40)
    ) +
    facet_wrap(~ scenario, ncol = 1) +
    theme_bw(base_size = 10) +
    theme(
      strip.background = element_blank(),
      panel.grid = element_blank(),
    )
  png_file <- "sir_ode_r.png"
  ggsave(png_file, fig, width = 640, height = 480, units = "px", dpi = 150)
}


demonstration <- function() {
  settings <- default_settings()
  default_scenario <- run_model(settings)
  scaled_beta_scenario <- run_model_scaled_beta(settings, scale=1.5)
  scaled_gamma_scenario <- run_model_scaled_gamma(settings, scale=0.7)

  plot_prevalence_time_series(
    list(
      Default = default_scenario,
      `Scaled Beta` = scaled_beta_scenario,
      `Scaled Gamma` = scaled_gamma_scenario
    )
  )
}

demonstration()
