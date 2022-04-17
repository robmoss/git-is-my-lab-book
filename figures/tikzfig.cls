%
% A LaTeX document class for stand-alone TikZ figures.
%
% Version 1.0 (2022/04/15)
%
% Authors:
% Rob Moss
%
% License: CC BY-SA 4.0 (http://creativecommons.org/licenses/by-sa/4.0/)
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tizkfig}[2022/04/15 Standalone TikZ figures]

\LoadClass[crop,tikz]{standalone}

%
% TikZ libraries.
%

% Provides "Latex" arrow tips.
\usetikzlibrary{arrows.meta}

% Allows positioning relative to other nodes (e.g., "1cm of X").
\usetikzlibrary{positioning}

% Add support for coordinate calculations.
\usetikzlibrary{calc}

%
% Other packages.
%

% Add support for using OpenType fonts.
\RequirePackage{fontspec}

% Define custom colours.
\RequirePackage{xcolor}

%
% Colour palette: Tomorrow
%

\definecolor{background}{RGB}{255,255,255}
\definecolor{background2}{RGB}{239,239,239}
\definecolor{background3}{RGB}{214,214,214}
\definecolor{normtext}{RGB}{77,77,76}
\definecolor{comment}{RGB}{142,144,140}
\definecolor{green}{RGB}{113,140,0}
\definecolor{orange}{RGB}{245,135,31}
\definecolor{yellow}{RGB}{234,183,0}
\definecolor{red}{RGB}{200,40,41}
\definecolor{blue}{RGB}{66,113,174}
\definecolor{violet}{RGB}{137,89,168}
\definecolor{cyan}{RGB}{62,153,159}

% Also define lighter versions of each colour.
\colorlet{lightgreen}{green!75!white}
\colorlet{lightorange}{orange!75!white}
\colorlet{lightyellow}{yellow!75!white}
\colorlet{lightred}{red!75!white}
\colorlet{lightblue}{blue!75!white}
\colorlet{lightviolet}{violet!75!white}
\colorlet{lightcyan}{cyan!75!white}

%
% Define custom commands and TikZ styles for git diagrams.
%

% A custom node style for commits:
%
%   \node[commit] (A) {A};
%   \node[commit] (B) [right = 1cm of A] {B};
%
\tikzstyle{commit}=[
    circle,
    minimum size = 0.75cm,
    draw=black,
    thick,
    fill=lightblue,
    text=black,
    font=\bfseries
]

\tikzstyle{link}=[
  -,
  black,
  thick,
  rounded corners = 0.25cm
]

% Link one commit (A) to the next commit (B) on the same branch:
%
%   \nextcommit{A}{B}
%
\newcommand{\nextcommit}[2]{%
  \draw[link] (#1) -- (#2);%
}

% Link one commit (A) to a commit (B) on a different branch:
%
%   \changebranch{A}{B}
%
\newcommand{\changebranch}[2]{%
  \draw[link] (#1) -| ($(#1)!0.5!(#2)$) |- (#2);%
}
