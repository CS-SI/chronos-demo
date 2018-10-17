#!/usr/bin/python
import os
import sys
import json


INPUT_FILES_NB = 150
BASE_PATH = sys.argv[1] if len(sys.argv) > 1 else '/data/toil/input'

if __name__ == '__main__':
    input_args = dict()
    input_args['L0B_HR_RAW_150'] = []

    for i in range(INPUT_FILES_NB):
        input_file = {'class': 'File',
                      'path': os.path.join(BASE_PATH, 'infile{:03}.txt').format(i + 1)}
        input_args['L0B_HR_RAW_150'].append(input_file)
    with open('args.json', 'wt') as fd:
        json.dump(input_args, fd)

