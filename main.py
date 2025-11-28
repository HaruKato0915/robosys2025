#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2025 Haru kato
# SPDX-License-Identifier: GPL-3.0-only

import sys

def main():
    text = sys.stdin.read().strip()

    # 空入力 → エラー（出力なし・終了コード 1）
    if text == "":
        sys.exit(1)

    # 英字以外が含まれていたらエラー（出力なし・終了コード 1）
    if not text.isalpha():
        sys.exit(1)

    # 母音カウント
    vowels = "aeiouAEIOU"
    count = sum(1 for c in text if c in vowels)

    print(count)
    sys.exit(0)

if __name__ == "__main__":
    main()




