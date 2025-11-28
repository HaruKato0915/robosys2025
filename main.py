#!/usr/bin/env python3
import sys

def main():
    text = sys.stdin.read().strip()

    # 空入力 → エラー
    if not text:
        exit(1)

    # 英字以外が1文字でもあったらエラー
    if not text.isalpha():
        exit(1)

    vowels = "aeiou"
    text = text.lower()

    count = sum(1 for c in text if c in vowels)

    print(count)
    exit(0)

if __name__ == "__main__":
    main()





