#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------

rm -rf ${CLADES}
mkdir -p ${CLADES}

# ------------------------------------------------------------------------
# Make clades
# ------------------------------------------------------------------------

echo 1>&2 '# Make clades'

${PIPELINE}/scripts/make-clades.pl \
	   -F ${FASTANI}/fastani.txt \
	   -c ${SPECIES_CUTOFF} \
	   -d ${CLADES}/species.dot \
	   > ${CLADES}/species.txt

${PIPELINE}/scripts/make-clades.pl \
	   -F ${FASTANI}/fastani.txt \
	   -c ${GENUS_CUTOFF} \
	   -d ${CLADES}/genus.dot \
	   > ${CLADES}/genus.txt

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'

