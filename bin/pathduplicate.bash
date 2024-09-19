#!/bin/bash

# This Will remove duplicate entries from the PATH variable while keeping the order.

# Split $PATH into lines, remove duplicates, and then join back with colon
clean_path=$(echo "$PATH" | tr ':' '\n' | awk '!seen[$0]++' | paste -sd ':' -) 

# Export the cleaned PATH
export PATH="$clean_path"

echo "$PATH" | tr ':' '\n'