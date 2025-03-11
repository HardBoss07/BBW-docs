#!/bin/bash

# To run this script use these commands in a bash shell:
# chmod +x script.sh
# ./script.sh

# Correct array declaration
DIRECTORIES=(M114 M164 M293 M431)

create_files() {
    SCRIPT_DIR=$(dirname "$0")
    MODULE="$1"

    DOCS_DIR="$SCRIPT_DIR/$MODULE/docs"
    CURRENT_DATE=$(date +"%d-%m-%Y")

    NEW_DIR="$DOCS_DIR/$CURRENT_DATE"

    # Check if the directory already exists
    if [ -d "$NEW_DIR" ]; then
        echo "Directory $NEW_DIR already exists. Skipping."
        return
    fi

    # Create the directory
    mkdir -p "$NEW_DIR"

    # Create page.md file
    PAGE_FILE="$NEW_DIR/page.md"
    touch "$PAGE_FILE"

    echo "Created $PAGE_FILE successfully."

    # Update notizen.md
    INDEX_FILE="$DOCS_DIR/notizen.md"
    NEW_ENTRY="- [Lektion von $CURRENT_DATE](/docs/$CURRENT_DATE/page.md)"

    echo -e "$NEW_ENTRY" >> "$INDEX_FILE"

    echo "Updated $INDEX_FILE with new entry."
}

# Loop through each module and call create_files
for module in "${DIRECTORIES[@]}"; do
    create_files "$module"
done
