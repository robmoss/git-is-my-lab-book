#!/usr/bin/env python3
"""
Generate CSS themes for asciinema-player.
"""

import textwrap


def write_theme_css(name, palette_str):
    """
    Write a CSS file for a single asciinema-player theme.

    :param name: The name of the theme.
    :param palette_str: The theme colours (background, foreground, and palette
        of 16 colours) provided a single comma-separated string, where each
        colour is a six-character hex code (without the leading '#').
    """
    # We should have a background, a foreground, and 16 palette colours.
    palette = palette_str.split(',')
    n_colours = len(palette)
    if n_colours != 18:
        raise ValueError(f'palette_str contains {n_colours} colours')

    bg = palette[0]
    fg = palette[1]
    colours = palette[2:]

    theme_class = f'.asciinema-theme-{name}'
    base_class = '.asciinema-terminal'

    css_str = textwrap.dedent(f"""
    {theme_class} {base_class} {{
        color: #{fg};
        background-color: #{bg};
        border-color: #{bg};
    }}

    {theme_class} .fg-bg {{
        color: #{bg};
    }}

    {theme_class} .bg-fg {{
        background-color: #{fg};
    }}
    """)

    for ix in range(16):
        css_str += textwrap.dedent(f"""
        {theme_class} .fg-{ix} {{
            color: #{colours[ix]};
        }}

        {theme_class} .bg-{ix} {{
            background-color: #{colours[ix]};
        }}
        """)

    output_file = f'asciinema-theme-{name}.css'
    with open(output_file, 'w') as f:
        f.write(css_str)


# NOTE: this is agg's default theme (https://github.com/asciinema/agg/).
theme_name = 'dracula'
palette_str = (
    "282a36,f8f8f2,21222c,ff5555,50fa7b,f1fa8c,bd93f9,ff79c6,8be9fd,"
    "f8f8f2,6272a4,ff6e6e,69ff94,ffffa5,d6acff,ff92df,a4ffff,ffffff")

write_theme_css(theme_name, palette_str)
