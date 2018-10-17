#!/bin/bash
INPUT_DIR=${1:-/data/toil/input}
mkdir -p $INPUT_DIR
for i in {001..150}
do
    echo 'hello world' > ${INPUT_DIR}/infile${i}.txt
done
