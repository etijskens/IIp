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

#-------------------------------------------------------------------------------
# FUNCTIONS
#-------------------------------------------------------------------------------
# Help - Display help for this script.
Help()
{
  echo "Set up micc2 environment."
  echo
  echo "Syntax: source iip-env.sh [-p python_module]"
  echo "p <python_module>: load Python module <python_module> instead of the default Python module."
  echo "h  Print this Help."
  echo
  exit 
}
#-------------------------------------------------------------------------------
# start of main script
#-------------------------------------------------------------------------------
# handle arguments
if [ -z $1 ]
then 
    python_module="Python"
else
    if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [[ $1 == -* ]]
    then
        echo "usage: source iip-env.sh [ -h | --help | python_module_to_load ]"
        return 1
    else
        python_module=$1
    fi
fi

# Start from a clean environment:
module purge
module load $VSC_INSTITUTE_CLUSTER/supported

# load recent versions of git, gh, and CMake for micc2
module load git
module load gh
module load CMake

# Select the Python version of your choice.
# However, if you change the Python module,
#   . make sure that the  build environment of that Python environment is also loaded
#   . you might need a module with pre-installed Python packages useful for scientific
#     computing, such as numpy, mpi4py, matplotlib, scipy, sympy ...
module load ${python_module}

module list

# The next line ensures that `pip install --user <package>` installs package in
#   $VSC_SCRATCH/.local/lib/pythonX.Y/site-packages/package
# and not in $VSC_HOME/.local
export PYTHONUSERBASE=$VSC_SCRATCH/.local
# adjust the PATH such that installed apps are available.
export PATH=$PYTHONUSERBASE/bin:$PATH

