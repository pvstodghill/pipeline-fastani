#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------

rm -rf ${FASTANI}
mkdir -p ${FASTANI}

# ------------------------------------------------------------------------
# Run fastANI
# ------------------------------------------------------------------------

echo 1>&2 '# Run fastANI'

ls ${INPUTS}/*.fna > ${FASTANI}/genomes.txt

fastANI --rl ${FASTANI}/genomes.txt \
	--ql ${FASTANI}/genomes.txt \
	-t ${THREADS} \
	--matrix --output ${FASTANI}/raw_fastani.txt

# ------------------------------------------------------------------------
# Cleanup fastANI output
# ------------------------------------------------------------------------

echo 1>&2 '# Cleanup fastANI output'

cat ${FASTANI}/raw_fastani.txt \
    | sed -e 's|'${INPUTS}/'||g' -e 's|\.fna||g' \
	  > ${FASTANI}/fastani.txt

cat ${FASTANI}/raw_fastani.txt.matrix \
    | sed -e 's|'${INPUTS}/'||g' -e 's|\.fna||g' \
	  > ${FASTANI}/fastani.txt.matrix

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'

