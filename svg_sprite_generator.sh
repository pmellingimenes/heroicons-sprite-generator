#!/bin/bash

MOUNTED_DIR="/app/mounted-dir"

mkdir -p "${MOUNTED_DIR}/build"

git clone --depth 1 --branch v2.1.1  https://github.com/tailwindlabs/heroicons.git

process_svg_files() {
    local SVG_DIR=$1
    local OUTPUT_FILE=$2

    echo '<svg style="display: none;">' > "$OUTPUT_FILE"

    for file in "$SVG_DIR"/*.svg; do
        FILENAME=$(basename "$file" .svg)
        SVG_CONTENT=$(sed '/<?xml/d;/<!DOCTYPE/d;/<svg/d;/<\/svg/d' "$file")

        echo "<symbol id=\"$FILENAME\" viewBox=\"0 0 24 24\">" >> "$OUTPUT_FILE"
        echo $SVG_CONTENT >> "$OUTPUT_FILE"
        echo "</symbol>" >> "$OUTPUT_FILE"
    done

    echo '</svg>' >> "$OUTPUT_FILE"
    # Minify SVG icons
    svgo -i "$OUTPUT_FILE" -o "$OUTPUT_FILE" --config=./svgo.config.mjs
    echo "SVG icons have been processed and saved to $OUTPUT_FILE"
}

process_svg_files "heroicons/src/24/solid/" "${MOUNTED_DIR}/build/icons-solid.svg"
process_svg_files "heroicons/src/24/outline/" "${MOUNTED_DIR}/build/icons-outline.svg"
process_svg_files "heroicons/src/20/solid/" "${MOUNTED_DIR}/build/icons-mini.svg"
process_svg_files "heroicons/src/16/solid/" "${MOUNTED_DIR}/build/icons-micro.svg"
