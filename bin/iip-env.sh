#!/bin/bash
# This bash script sets the environment for parallel programming projects managed by micc2.
# It loads
# . cluster modules needed by micc2
# . a cluster module with a suitable Python distribution
# . ensure that `pip install --user` installs in $VSC_SCRATCH/.local

if [[ $_ == $0 ]]
then
    echo "ERROR: This script must be sourced!" >&2
    exit 127
fi

# load recent versions of git, gh, and CMake for micc2
module load git
module load gh
module load CMake

# Select the Python version of your choice.
# However, if you change the Python module,
#   . make sure that the  build environment of that Python environment is also loaded
#   . you might need a module with pre-installed Python packages useful for scientific
#     computing, such as numpy, mpi4py, matplotlib, scipy, sympy ...
module load Python

module list

# The next line ensures that `pip install --user <package>` installs package in
#   $VSC_SCRATCH/.local/lib/pythonX.Y/site-packages/package
# and not in $VSC_HOME/.local
export PYTHONUSERBASE=$VSC_SCRATCH/.local
# adjust the PATH such that installed apps are available.
export PATH=$PYTHONUSERBASE/bin:$PATH