#! /usr/bin/bash

# Run this script to generate the equations into PDF format

# PDF or project name, change this
jobname=equations
# String for the equation. Change it as you want
texstr="
  \displaystyle
  H = \Delta \sigma_z +\omega a^{\dagger}a + g \sigma_z (a^{\dagger} + a)
"

# Patch to solve relative path problems
path2this=./img/svg_src/tex
echo $texstr > $path2this/equations.tex

# Substitute relative to path2this/relative in file for the input.tex
latexmk -pdf -shell-escape -jobname=$path2this/$jobname $path2this/main.tex
latexmk -pdf -shell-escape -c -jobname=$path2this/$jobname $path2this/main.tex

exit