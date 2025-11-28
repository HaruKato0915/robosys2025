#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2025 Haru kato
# SPDX-License-Identifier: GPL-3.0-only

import sys
import string

def main():
    text = sys.stdin.read().strip()
    
    # 空文字の場合はエラー終了
    if not text:
        exit(1)
    
    # 英字以外が含まれる場合もエラー終了
    if not all(c in string.ascii_letters for c in text):
        exit(1)
    
    # 母音カウント
    vowels = "aeiou"
    count = sum(1 for c in text.lower() if c in vowels)
    print(count)
    exit(0)

if __name__ == "__main__":
    main()





