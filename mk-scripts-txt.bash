#!/bin/bash

find scripts -type f | while read FNAME; do
    if [ "${FNAME:(-5)}" = ".bash" ]; then
        cp "$FNAME" "$FNAME.txt"
    fi
done
