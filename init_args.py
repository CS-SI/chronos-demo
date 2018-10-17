#!/usr/bin/python
import os
import json


HERE = os.path.dirname(__file__)
INPUT_FILES_NB = 150

if __name__ == '__main__':
    input_args = dict()
    input_args['L0B_HR_RAW_150'] = []

    for i in range(INPUT_FILES_NB):
        input_file = {'class': 'File',
                      'path': '/data/toil/input/infile{:03}.txt'.format(i + 1)}
        input_args['L0B_HR_RAW_150'].append(input_file)
    with open(os.path.join(HERE, 'args.json'), 'wt') as fd:
        json.dump(input_args, fd)
