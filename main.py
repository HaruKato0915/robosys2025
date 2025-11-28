#!/usr/bin/env python3
import sys

def main():
    text = sys.stdin.read().strip().lower()
    vowels = "aeiou"
    count = sum(1 for c in text if c in vowels)
    print(count)

if __name__ == "__main__":
    main()

