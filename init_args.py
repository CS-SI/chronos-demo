#!/usr/bin/python
import os
import sys
import json


BASE_PATH = sys.argv[1] if len(sys.argv) > 1 else '/data/toil/input'

if __name__ == '__main__':
    input_args = dict()
    input_args['L0B_HR_RAW_150'] = []

    files = os.listdir(BASE_PATH)
    for i in sorted(files):
        input_file = {'class': 'File',
                      'path': os.path.join(BASE_PATH, i)}
        input_args['L0B_HR_RAW_150'].append(input_file)
    with open('args.json', 'wt') as fd:
        json.dump(input_args, fd)

    print('args.json generated with link to {} files'.format(len(files)))

