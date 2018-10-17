#!/usr/bin/python

import sys
import time
import random

if __name__ == '__main__':
    time.sleep(random.randint(5, 15))
    print(sys.argv[1])
