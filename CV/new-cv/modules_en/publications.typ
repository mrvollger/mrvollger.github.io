// Imports
#import "@preview/brilliant-cv:2.0.3": cvSection, cvPublication
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)

#cvSection("Publications")

#show "First, Ed.": "First Author"
#show "Last, Ed.": "Last Author"

// remove the weird ", Ed." that is added to the "editor" name
#show regex(", Ed\."): name => []

#let first_first = state("x", "First Author")
#show "First": name => [ 
  #set align(center)
  #text(context first_first.get(), weight: "extrabold")
  #first_first.update(x => sym.dash.em)
]

#let first_last = state("y", "Corresponding")
#show "Last": name => [ 
  #set align(center)
  #text(context first_last.get(), weight: "extrabold")
  #first_last.update(y => sym.dash.em)
]

#let first_collab = state("z", "Collaborative")
#show "other": name => [ 
  #set align(center)
  #text(context first_collab.get(), weight: "extrabold")
  #first_collab.update(z => sym.dash.em)
]


#bibliography(
  ("../src/first-author.bib", "../src/last-author.bib", "../src/collaborative-author.bib"),
  title: none,
  full: true,
  style: "../cv.csl",
)


//#cvPublication(
//  bib: bibliography("../src/works.bib"),
//  keyList: (
//    "Vollger_2023a",
//  ),
//  refStyle: "cv.csl",
//)