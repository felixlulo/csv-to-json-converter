## Overview
This is a bash script that converts CSV files to JSON files.\
The script is simple and easy to use, making it a great tool for converting CSV data into a more easily readable format.

## Usage
The script can be run from the command line by passing in the path to the CSV file as a command line argument.\
For example: `./csv_to_json.sh path/to/csv/file.csv`

## Implementation Details
The script uses the `jq` library to handle the conversion of the CSV data into JSON format. This library is available in most Linux distributions and can be installed using the package manager of your choice.

## Example
Some sample CSV files are included in the `/csv` subfolder of the project.\
The following command will convert the sample file to JSON format:
`./csv_to_json.sh csv/eu_countries_basic_info.csv`

## Conclusion
In conclusion, this bash script provides a quick and easy solution for converting CSV data into JSON format. Whether you need to process large amounts of data or just want to make your data more readable, this script is a great tool to have in your toolkit.
