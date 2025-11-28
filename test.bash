#!/bin/bash
# SPDX-FileCopyrightText: 2025 C-joker
# SPDX-License-Identifier* BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### NORMAL INPUT ###
out=$(seq 5 | ./main.py)
[ "${out}" = 15 ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./main.py)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "${out}" ] || ng "$LINENO"

### EMPTY INPUT ###
out=$(echo | ./main.py)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "${out}" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res

