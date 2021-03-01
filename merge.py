#!/usr/bin/env python3

from typing import List
import sys
import os

def concat(in1: str, in2: str) -> None:
    """ Concatenate two videos """
    os.system(f'./concat.sh {in1} {in2}')

def timediff(in1: str, in2: str) -> int:
    """ Get time difference in seconds between two videos """
    return int(os.popen(f'./timediff.sh {in1} {in2}').read())

def main() -> None:
    files = sys.argv[1:]
    file_idx1 = 0
    file_idx2 = 1
    while (file_idx1 < len(files)-1 and file_idx2 < len(files)):
        file1 = files[file_idx1]
        file2 = files[file_idx2]
        if timediff(file1, file2) < 30: # seconds
            concat(file1, file2)
            file_idx2 += 1
        else:
            file_idx1 = file_idx2
            file_idx2 += 1

if __name__ == '__main__':
    main()
