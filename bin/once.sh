#!/bin/bash

if [[ $_ == $0 ]]
then
    echo "ERROR: This script must be sourced!" >&2
    exit 127
fi

# setup the environment
. ./env.sh

pip install --user et-micc2 numba

