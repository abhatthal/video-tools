#!/usr/bin/env python3
""" Calculates the total duration of given videos """

import os
import sys
import datetime

def get_duration(file: str) -> float:
    return float(os.popen(f'ffprobe -v quiet -of csv=p=0 -show_entries format=duration {file}').read())

def main() -> None:
    files = sys.argv[1:]
    seconds = sum([get_duration(file) for file in files])
    print(str(datetime.timedelta(seconds=seconds)))

if __name__ == '__main__':
    main()
