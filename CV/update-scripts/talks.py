#!/usr/bin/env python3

import pandas as pd
import argparse
import sys

# Set up argument parser
parser = argparse.ArgumentParser(description='Convert talks from Excel to Typst format.')
parser.add_argument('-i', '--input', default='talks.xlsx', help='Input Excel file (default: talks.xlsx)')
parser.add_argument('-o', '--output', default=None, help='Output file (default: stdout)')
args = parser.parse_args()

# Read the Excel file
df = pd.read_excel(args.input)

# Open the output file or use stdout
output = sys.stdout if args.output is None else open(args.output, 'w')

# Write the header
output.write('#import "@preview/brilliant-cv:2.0.3": cvSection, cvEntry, hBar\n')
output.write('#let metadata = toml("../metadata.toml")\n')
output.write('#let cvSection = cvSection.with(metadata: metadata)\n')
output.write('#let cvEntry = cvEntry.with(metadata: metadata)\n\n')
output.write('#cvSection("Presentations")\n\n')

# Write each entry
for index, row in df.iterrows():
    output.write('#cvEntry(\n')
    output.write(f'  title: [{row["Title"]}],\n')
    output.write(f'  society: [{row["Society"]}],\n')
    output.write(f'  location: [{row["Location"]}],\n')
    output.write(f'  date: [{row["Date"]}],\n')
    output.write('  description: none,\n')
    output.write(')\n\n')

# Close the output file if it's not stdout
if output is not sys.stdout:
    output.close()