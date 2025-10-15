#!/usr/bin/env bash
# tomltoyaml.sh
# Version: 0.0.1
# Description: to Convert TOML to YAML
# Usage: tomltoyaml.sh <input toml> [<input yaml>]
# Requirements: Checks for yq dependency.
# Alias: yamlfy


# Check if yq is installed
if ! command -v yq &> /dev/null; then
  echo "Error: yq is required. Install it with 'sudo apt install yq' or equivalent."
  exit 1
fi

# Check if input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_file> [<output.yaml>]"
  exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="$2"

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: Input file '$INPUT_FILE' does not exist."
  exit 1
fi

# Check for .toml extension or TOML syntax
if [[ "$INPUT_FILE" != *.toml ]]; then
  # Basic TOML syntax check (e.g., lines with key = value or [section])
  if ! grep -Eq '^\s*(\[.*\]|\w+\s*=.*)' "$INPUT_FILE"; then
    echo "Error: Input file '$INPUT_FILE' does not have .toml extension or valid TOML syntax."
    exit 1
  fi
fi

# Determine output file name
if [ -z "$OUTPUT_FILE" ]; then
  # Default: replace .toml (if present) with .yaml, else append .yaml
  OUTPUT_FILE="${INPUT_FILE%.toml}.yaml"
fi

# If output file exists, append _1, _2, etc.
BASE_NAME="${OUTPUT_FILE%.yaml}"
COUNTER=1
TEMP_OUTPUT="$OUTPUT_FILE"
while [ -f "$TEMP_OUTPUT" ]; do
  TEMP_OUTPUT="${BASE_NAME}_${COUNTER}.yaml"
  ((COUNTER++))
done
OUTPUT_FILE="$TEMP_OUTPUT"

# Convert TOML to YAML using yq
yq -P 'to_yaml' "$INPUT_FILE" > "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
  echo "Converted '$INPUT_FILE' to '$OUTPUT_FILE'"
else
  echo "Error: Conversion failed."
  exit 1
fi