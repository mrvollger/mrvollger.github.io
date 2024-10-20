#import "@preview/brilliant-cv:2.0.3": cvSection, cvEntry
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

#cvSection("Funding and Awards")

#cvEntry(
  title: [K99/R00 Pathway to Independence Award],
  society: [National Institute of General Medical Sciences],
  date: [Summer 2024 - present],
  location: "Seattle, Washington",
  description: ""
)

#cvEntry(
  title: [NIH/NHGRI T32 Genome Training Grant],
  society: [Division of Medical Genetics at University of Washington],
  date: [Fall 2022 - Fall 2024],
  location: "Seattle, Washington",
  description: ""
)

#cvEntry(
  title: [BDGN, Big Data in Genomics and Neuroscience],
  society: [Genome Sciences at University of Washington],
  date: [Fall 2017 - Fall 2019],
  location: "Seattle, Washington",
  description: ""
)

#cvEntry(
  title: [NIH/NHGRI T32 Genome Training Grant],
  society: [Genome Sciences at University of Washington],
  date: [Fall 2016 - Fall 2017],
  location: "Seattle, Washington",
  description: "" 
)


