#!/bin/bash

# Function to ungzip files recursively
ungzip_files() {
    local source="$1"
    local target="$2"

    # Iterate over files and directories in the source folder
    for item in "$source"/*; do
        if [[ -d "$item" ]]; then
            # If it's a directory, create the corresponding directory in the target folder
            mkdir -p "$target/$(basename "$item")"
            # Recursively call the function for the subdirectory
            ungzip_files "$item" "$target/$(basename "$item")"
        elif [[ -f "$item" && "$item" == *.gz ]]; then
            # If it's a .gz file, ungzip it and save it to the corresponding directory in the target folder
            filename=$(basename "$item" .gz)
            gunzip -c "$item" > "$target/$filename"
        fi
    done
}

# Check if correct number of arguments provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_folder> <target_folder>"
    exit 1
fi

source_folder="$1"
target_folder="$2"

# Check if source folder exists
if [ ! -d "$source_folder" ]; then
    echo "Source folder '$source_folder' not found."
    exit 1
fi

# Create target folder if it doesn't exist
mkdir -p "$target_folder"

# Call the function to ungzip files recursively
ungzip_files "$source_folder" "$target_folder"

echo "Ungzipping completed."
