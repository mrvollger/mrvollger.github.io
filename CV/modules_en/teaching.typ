#import "@preview/brilliant-cv:2.0.3": cvSection, cvEntry, hBar
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

#cvSection("Teaching Experience")

#cvEntry(
  title: [Gene discovery and comparative genomics],
  society: [Invited Lecutre, Genomics and Proteomics, undergraduate course],
  date: [October 2022],
  description: none,
  location: [University of Washington],
)

#cvEntry(
  title: [Introduction to Statistical Genomics],
  society: [Primary Instructor, Introduction to Statistical Genomics, graduate course],
  date: [Spring 2022],
  description: none,
  location: [University of Washington],
)

#cvEntry(
  title: [Introduction to Computational Molecular Biology],
  society: [Teaching Assistant, Lead weekly discussion sections, organized and graded assignments, and held office hours],
  date: [Winter 2020],
  description: none,
  location: [University of Washington],
)

#cvEntry(
  title: [Fundamentals of Genetics and Genomics],
  society: [Teaching Assistant, Lead weekly discussion sections, organized and graded assignments, and held office hours],
  date: [Summer 2019],
  location: [University of Washington],
  description: none,
)
