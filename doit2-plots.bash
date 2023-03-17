#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------

rm -rf ${PLOTS}
mkdir -p ${PLOTS}

# ------------------------------------------------------------------------
# Make plots
# ------------------------------------------------------------------------

echo 1>&2 '# Make plots'

${PIPELINE}/fastANI_heatmap.R ${FASTANI}/fastani.txt ${PLOTS}/fastani.pdf

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'
