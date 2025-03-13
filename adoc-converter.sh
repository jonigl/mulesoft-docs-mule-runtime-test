#!/bin/bash

# Directory to process
INPUT_DIR="./"
OUTPUT_DIR="./output_text_directory"

# Directories to ignore (relative to INPUT_DIR)
IGNORE_DIRS=(
    ".git"
    "output_text_directory"
)

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Build the find command with exclusions properly
find_cmd="find \"$INPUT_DIR\" -name \"*.adoc\""

# Add exclusion paths to the find command
for dir in "${IGNORE_DIRS[@]}"; do
    find_cmd+=" -not -path \"$INPUT_DIR/$dir/*\""
done

# Execute find command and process files
echo "Searching for .adoc files..."
eval $find_cmd | while read -r file; do
    if [ ! -f "$file" ]; then
        echo "Warning: File not found or not accessible: $file"
        continue
    fi

    # Create relative path for output
    rel_path=${file#"$INPUT_DIR/"}
    output_file="$OUTPUT_DIR/${rel_path%.adoc}.txt"
    
    # Create directory structure for output file
    mkdir -p "$(dirname "$output_file")"
    
    echo "Converting: $file"
    
    # Convert AsciiDoc to plaintext with error handling
    if ! asciidoctor -b docbook "$file" -o - 2>/dev/null | pandoc -f docbook -t plain -o "$output_file" 2>/dev/null; then
        echo "Error: Failed to convert $file"
    else
        echo "Converted: $file -> $output_file"
    fi
done

echo "Conversion process complete."
