#!/bin/bash

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

export PATH=$PYTHONUSERBASE/bin:$PATH