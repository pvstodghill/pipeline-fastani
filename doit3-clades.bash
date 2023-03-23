#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------

rm -rf ${CLADES}
mkdir -p ${CLADES}

# ------------------------------------------------------------------------
# Make clades
# ------------------------------------------------------------------------

echo 1>&2 '# Make clades'

echo 1>&2 '## Make species list'
${PIPELINE}/scripts/make-clades.pl \
	   -F ${FASTANI}/fastani.txt \
	   -c ${SPECIES_CUTOFF} \
	   > ${CLADES}/species.txt

echo 1>&2 '## Make genus list'
${PIPELINE}/scripts/make-clades.pl \
	   -F ${FASTANI}/fastani.txt \
	   -c ${GENUS_CUTOFF} \
	   > ${CLADES}/genus.txt

echo 1>&2 '## Make .dot file'
${PIPELINE}/scripts/make-clades.pl \
	   -F ${FASTANI}/fastani.txt \
	   -c 0.0 \
	   -d ${CLADES}/fastani.dot \
	   > /dev/null



# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'

