#!/bin/bash
# This script installs some Python packages which are not preinstalled on the cluster
# . micc2: project management for python/C++/Fortran projects: https://et-micc2.readthedocs.io/en/latest/
# . numba: accelerating Python functions: https://numba.pydata.org

if [[ $_ == $0 ]]
then
    echo "ERROR: This script must be sourced!" >&2
    exit 127
fi

MY_PATH=$(dirname "$0")
echo "$MY_PATH"

# setup the environment (assumed to be run from the IIp project directory)
source ./bin/env.sh

pip install --user et-micc2 numba

