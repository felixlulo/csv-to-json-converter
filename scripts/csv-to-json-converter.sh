#!/bin/bash

# This script converts a CSV file to a JSON file
# Usage: ./csv_to_json.sh file.csv
# Output: file.json
clear


# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
  echo "Usage: ./csv_to_json.sh file.csv"
  exit 1
fi

# Check if the input file exists
if [ ! -f "$1" ]; then
  echo "Error: Input file does not exist"
  exit 1
fi

# Define the input and output files
input_file="$1"
output_file="$(basename "$1" .csv).json"

# Read the header line of the CSV file and create the keys of the JSON objects
keys=$(head -n 1 "$input_file")
keys=$(echo $keys | tr ',' '\n' | tr -d '\r')

# Read the rest of the CSV file and create the values of the JSON objects
values=$(tail -n +2 "$input_file")
values=$(echo "$values" | tr '\r' '\n' | awk -F, '{printf "{\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\"},\n", '"$keys"'}')

# Create the final JSON array by concatenating the keys and values
json="["
json="$json$(echo "$values" | sed '$ s/.$//')"
json="$json]"

# Write the final JSON array to the output file
echo "$json" > "$output_file"

# Success message
echo "Conversion from CSV to JSON completed"
echo "Output file: $output_file"