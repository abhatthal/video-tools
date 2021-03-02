#!/usr/bin/env python3
""" Lists all very short videos """
# Allows user to review videos and decide if they want to delete them

import sys

from duration import get_duration

def main() -> None:
    seconds = int(sys.argv[1])
    files = sys.argv[2:]
    print(*list(filter(lambda file: get_duration(file) < seconds, files)), sep='\n')

if __name__ == '__main__':
    main()
