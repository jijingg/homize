#!/bin/bash

# Split $PATH into individual paths
IFS=':' read -ra paths <<< "$PATH"

# Use an associative array to record paths that have already been seen
declare -A seen_paths

# Array to store deduplicated paths
unique_paths=()

# Iterate over each path
for path in "${paths[@]}"; do
  # If the path has not been seen, add it to the result
  if [ -z "${seen_paths[$path]}" ]; then
    unique_paths+=("$path")
    seen_paths[$path]=1
  fi
done

# Recombine the deduplicated paths into the $PATH format
unique_path_string=$(IFS=':'; echo "${unique_paths[*]}")

# Set the deduplicated paths back to $PATH
export PATH="$unique_path_string"

# Output the updated $PATH
echo "Updated PATH: $PATH"