// Imports
#import "@preview/brilliant-cv:2.0.3": cvSection, cvPublication
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)


#cvSection("Publications")

#bibliography(
  "../src/works.bib",
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