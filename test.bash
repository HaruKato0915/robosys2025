#!/bin/bash
# SPDX-FileCopyrightText: 2025 haru kato
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### NORMAL INPUT ###
# hello → 母音 "e" "o" の 2 個
out=$(echo hello | ./main.py)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = 2 ] || ng "$LINENO"

# aiueo → 母音 5 個
out=$(echo aiueo | ./main.py)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = 5 ] || ng "$LINENO"


### STRANGE INPUT（英字以外 → エラー）###
out=$(echo あ | ./main.py)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "${out}" ] || ng "$LINENO"

out=$(echo 123 | ./main.py)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "${out}" ] || ng "$LINENO"


### EMPTY INPUT（空文字 → エラー）###
out=$(echo | ./main.py)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "${out}" ] || ng "$LINENO"


[ "${res}" = 0 ] && echo OK
exit $res



