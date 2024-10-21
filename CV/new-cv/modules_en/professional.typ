#import "@preview/brilliant-cv:2.0.3": cvSection, cvEntry
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

#cvSection("Postdoctoral Experience")

#cvEntry(
  title: [Postdoctoral Scholar in the Division of Medical Genetics],
  location: [University of Washington],
  date: [April 2022 - Present],
  society: [In the lab of Andrew B. Stergachis],
  description: none,
)

#cvEntry(
  title: [Postdoctoral Scholar in the Department of Genome Sciences],
  location: [University of Washington],
  date: [March 2021 - April 2022],
  society: [In the lab of Evan E. Eichler],
  description: none,
)
