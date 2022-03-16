#!/bin/bash
# This bash script sets the environment for our parallel programming projects
# . lood modules needed by micc2
# . load a Python distribution
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

# select the Python version of your choice
module load Python

module list

# The next line ensures that `pip install --user <package>` installs package in
#   $VSC_SCRATCH/.local/lib/pythonX.Y/site-packages/package
# and not in $VSC_HOME/.local
export PYTHONUSERBASE=$VSC_SCRATCH/.local
# adjust the PATH
export PATH=$PYTHONUSERBASE/bin:$PATH