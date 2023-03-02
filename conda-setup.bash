#! /bin/bash

set -e

NAME=pipeline-fastani

CONDA_PREFIX=$(dirname $(dirname $(type -p conda)))
. "${CONDA_PREFIX}/etc/profile.d/conda.sh"

PACKAGES=
#PACKAGES+=" pip"

PACKAGES+=" bioconductor-complexheatmap"
PACKAGES+=" fastani"
PACKAGES+=" r-gplots"
PACKAGES+=" r-reshape2"

if [ "$(type -p mamba)" ] ; then
    _conda="mamba --no-banner"
else
    _conda=conda
fi

function __ {
    echo + "$@"
    eval "$@"
}

if [ "$1" = -f ] ; then
    __ conda env remove -y --name ${NAME}
fi
if [ ! -d ${CONDA_PREFIX}/envs/${NAME} ] ; then
    __ conda create -y --name ${NAME}
fi
__ conda activate ${NAME}

__ $_conda install -y ${PACKAGES}

# __ pip install FIXME
