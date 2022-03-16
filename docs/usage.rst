.. highlight:: console
.. include:: hyperlinks.rst

*********************************
Using the development environment
*********************************

Preparing the environment for a (VSCode) terminal
-------------------------------------------------

Every time you open a new terminal, you must source the ``IIp/bin/iip-env.sh`` script::

    > source $VSC_SCRATCH/IIp/bin/iip-env.sh

If you want this script to be sourced automatically whenever you login to *Leibniz*, you can add
this command to your ``~/.bash_profile``. We do, however not, recommend this, unless this is really
**always** the environment you need.

In case you might want to use a different Python distribution than the default Python on *Leibniz*,
you can customize the script.

For how to use ``micc2``, please check out the documentation at micc2_.
