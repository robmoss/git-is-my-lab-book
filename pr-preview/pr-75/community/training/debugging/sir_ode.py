#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np
from scipy.integrate import solve_ivp


def sir_rhs(time, state, popn, beta, gamma):
    """
    The right-hand side for the vanilla SIR compartmental model.
    """
    s_to_i = beta * state[1] * state[0] / popn  # beta * I(t) * S(t) / N
    i_to_r = gamma * state[1]  # gamma * I(t)
    return [-s_to_i, s_to_i - i_to_r, i_to_r]


def run_model(settings):
    """
    Return the SIR ODE solution for the given model settings.
    """
    # Define the time span and evaluation times.
    sim_days = settings['sim_days']
    time_span = [0, sim_days]
    times = np.linspace(0, sim_days, num=sim_days + 1)
    # Define the initial state.
    popn = settings['population']
    exposures = settings['exposures']
    initial_state = [popn - exposures, exposures, 0]
    # Define the SIR parameters.
    params = (popn, settings['beta'], settings['gamma'])
    # Return the daily number of people in S, I, and R.
    return solve_ivp(
        sir_rhs, time_span, initial_state, t_eval=times, args=params
    )


def default_settings():
    """
    The default model settings.
    """
    return {
        'sim_days': 20,
        'population': 100,
        'exposures': 2,
        'beta': 1.0,
        'gamma': 0.5,
    }


def run_model_scaled_beta(settings, scale):
    """
    Adjust the value of ``beta`` before running the model.
    """
    settings['beta'] = scale * settings['beta']
    return run_model(settings)


def run_model_scaled_gamma(settings, scale):
    """
    Adjust the value of ``gamma`` before running the model.
    """
    settings['gamma'] = scale * settings['gamma']
    return run_model(settings)


def plot_prevalence_time_series(solutions):
    """
    Plot daily prevalence of infectious individuals for one or more scenarios.
    """
    fig, axes = plt.subplots(
        constrained_layout=True,
        nrows=len(solutions),
        sharex=True,
        sharey=True,
    )
    for ix, (scenario_name, solution) in enumerate(solutions.items()):
        ax = axes[ix]
        ax.title.set_text(scenario_name)
        ax.plot(solution.y[1], label='I')
        ax.set_xticks([0, 5, 10, 15, 20])
    # Save the figure.
    png_file = 'sir_ode_python.png'
    fig.savefig(png_file, format='png', metadata={'Software': None})


def demonstration():
    settings = default_settings()
    default_scenario = run_model(settings)
    scaled_beta_scenario = run_model_scaled_beta(settings, scale=1.5)
    scaled_gamma_scenario = run_model_scaled_gamma(settings, scale=0.7)

    plot_prevalence_time_series(
        {
            'Default': default_scenario,
            'Scaled Beta': scaled_beta_scenario,
            'Scaled Gamma': scaled_gamma_scenario,
        }
    )


if __name__ == '__main__':
    demonstration()
