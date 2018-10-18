#!/bin/bash
INPUT_NB=${1:-150}
INPUT_DIR=${2:-/data/toil/input}
mkdir -p $INPUT_DIR
for i in `seq 1 ${INPUT_NB}`
do
	echo 'hello world' > ${INPUT_DIR}/infile$(printf "%03d" ${i}).txt
done
echo "${INPUT_NB} generated into ${INPUT_DIR}"
exit 0
