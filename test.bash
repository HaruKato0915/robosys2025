#!/bin/bash
# SPDX-FileCopyrightText: 2025 haru kato
# SPDX-License-Identifier: BSD-3-Clause

set -o pipefail  # これで $(...) 内の exit code を正しく取得

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### NORMAL INPUT ###
# hello → 母音 "e" "o" の 2 個
out=$(echo hello | ./main.py)
ret=$?
[ "$ret" = 0 ] || ng "$LINENO"
[ "${out}" = 2 ] || ng "$LINENO"

# aiueo → 母音 5 個
out=$(echo aiueo | ./main.py)
ret=$?
[ "$ret" = 0 ] || ng "$LINENO"
[ "${out}" = 5 ] || ng "$LINENO"

### STRANGE INPUT（英字以外 → エラー）###
./main.py <<< "あ"
ret=$?
[ "$ret" = 1 ] || ng "$LINENO"

out=$(./main.py <<< "あ")
[ -z "${out}" ] || ng "$LINENO"

./main.py <<< "123"
ret=$?
[ "$ret" = 1 ] || ng "$LINENO"

out=$(./main.py <<< "123")
[ -z "${out}" ] || ng "$LINENO"

### EMPTY INPUT（空文字 → エラー）###
./main.py <<< ""
ret=$?
[ "$ret" = 1 ] || ng "$LINENO"

out=$(./main.py <<< "")
[ -z "${out}" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res

