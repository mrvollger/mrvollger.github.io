#!/usr/bin/env python3
import argparse
from pybtex.database import parse_file
from pybtex.database import BibliographyData, Entry

parser = argparse.ArgumentParser()
parser.add_argument("--me", default="Vollger")
parser.add_argument("bib", help="bibTex file to draw from", default="../../scripts/works.bib")
args = parser.parse_args()

bib_data = parse_file(args.bib)

first_data = BibliographyData()
last_data = BibliographyData()
other_data = BibliographyData()

# I can take over the editor field, since its not used in my bibs to show which author I am
# other fields didn't seem to work, so I'm using editor
special_field = "editor"

for key, entry in bib_data.entries.items():

    first_author = entry.persons['author'][0]
    last_author = entry.persons['author'][-1]
    
    if args.me in str(first_author):
        entry.fields[special_field] = "First"
        first_data.add_entry(key, entry)
    elif args.me in str(last_author):
        entry.fields[special_field] = "Last"
        last_data.add_entry(key, entry) 
    else:
        entry.fields[special_field] = "other"
        other_data.add_entry(key, entry)


open("src/first-author.bib", "w").write(first_data.to_string("bibtex"))
open("src/last-author.bib", "w").write(last_data.to_string("bibtex"))
open("src/collaborative-author.bib", "w").write(other_data.to_string("bibtex"))