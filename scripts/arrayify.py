#!/usr/bin/env python3

import json
import sys
from os.path import basename

def main():
    match sys.argv:
        case [_, input_file, output_file]:
            with open(input_file) as input_file:
                lines = [line.lstrip('"').rstrip("\",").rstrip('"') for line in input_file.read().splitlines()]
                with open(output_file, 'w') as output_file:
                    json.dump(lines, output_file, indent=4, ensure_ascii=False)
        case _:
            raise ValueError(f"Usage: {basename(__file__)} (path/to/input.txt) (path/to/output.json)")


if __name__ == "__main__":
    main()
