#!/bin/bash
INPUT_DIR=/data/toil/input
mkdir $INPUT_DIR
for i in {001..150}
do
    echo 'hello world' > ${INPUT_DIR}/infile${i}.txt
done
