#!/usr/bin/env python3

from typing import List
import sys
import os

def concat(in1: str, in2: str) -> None:
    os.system(f'./concat.sh {in1} {in2}')

def main() -> None:
    files = sys.argv[1:]
    file_idx1 = 0
    file_idx2 = 1
    for i, file in enumerate(files):
        pass

if __name__ == '__main__':
    main()
