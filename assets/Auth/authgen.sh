#!/bin/bash
#---------------------
# VE5REV
# Authentication Table Generator
#

# Define the letters for the headers
TOP_HEADER=$(echo {A..M} | tr ' ' ' ')   # Results in "A B C D E F G H I J K L M"

LEFT_HEADER_CHARS=(N O P Q R S T U V W X Y Z)

# 1. Print the top header (A-M)
# Add TWO leading spaces: one for the missing left letter, one for the space after it
echo "  $TOP_HEADER"

# 2. Loop through 13 rows, generating the grid and adding the left header (N-Z)
for i in {0..12}; do
    LEFT_CHAR=${LEFT_HEADER_CHARS[$i]}

    # Generate a 13-character random string (for the row)
    GRID_ROW=$(tr -dc A-Z0-9 </dev/urandom | head -c 13)

    # Format the grid row: Insert a single space after each character
    FORMATTED_ROW=$(echo "$GRID_ROW" | sed 's/./& /g')

    # Print the left header character, followed by a space, followed by the formatted grid row
    echo "$LEFT_CHAR $FORMATTED_ROW"
done
