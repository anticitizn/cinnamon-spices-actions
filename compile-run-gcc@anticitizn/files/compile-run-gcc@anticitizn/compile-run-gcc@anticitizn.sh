#! /bin/bash
FILENAME="$1"

# Get the file's base name (without the path)
BASENAME="$(basename "${FILENAME}")"

# Remove the file's original extension
OUTPUT="${BASENAME%.*}"

DIR="$(dirname "${FILENAME}")"
OUTPUT_DIR="${DIR}/${OUTPUT}"

# Compile all files using GCC
gcc -I./ -o "$OUTPUT_DIR" "$@" -Wall -lm

# Run the program
if [ -f "$OUTPUT" ]; then
    "./$OUTPUT"
fi

echo

# Hold the terminal open until a keypress is detected
read -n 1 -s -r -p "Press any key to close..."
