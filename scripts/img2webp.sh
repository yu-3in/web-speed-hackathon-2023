#!/bin/bash

# default params
PARAMS=('-m 6 -q 70 -mt -af -progress')

if [ $# -ne 0 ]; then
	PARAMS=$@;
fi

START_DIR=$(pwd)
FILE_TYPES="jpg|jpeg|tif|tiff|png"

shopt -s nullglob nocaseglob extglob

find "$START_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.tif" -o -iname "*.tiff" -o -iname "*.png" \) -exec sh -c '
    for FILE; do
        cwebp '"${PARAMS[*]}"' "$FILE" -o "${FILE%.*}.webp" && rm "$FILE"
    done
' sh {} +
