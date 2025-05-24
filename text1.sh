#! /bin/bash


if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

filename=$1

tempfile=$(mktemp)


awk 'NR < 5 {print; next} /welcome/ {gsub(/give/, "learning"); print} !/welcome/ {print}' "$filename" > "$tempfile"

mv "$tempfile" "$filename"

echo "Replacement complete in file: $filename"
