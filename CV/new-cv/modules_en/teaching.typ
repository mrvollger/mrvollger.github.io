#import "@preview/brilliant-cv:2.0.3": cvSection, cvEntry, hBar
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

#cvSection("Teaching Experience")

#cvEntry(
  title: [Gene discovery and comparative genomics],
  society: [Invited Lecutre],
  date: [October 2022],
  description: [Undergraduate Genomics and Proteomics course],
  location: [University of Washington],
)

#cvEntry(
  title: [Introduction to Statistical Genomics],
  society: [Primary Instructor],
  date: [Spring 2022],
  description: [Introduction to Statistical Genomics, graduate course],
  location: [University of Washington],
)

#cvEntry(
  title: [Introduction to Computational Molecular Biology],
  society: [Teaching Assistant],
  date: [Winter 2020],
  description: [Lead weekly discussion sections, organized and graded assignments, and held weekly office hours],
  location: [University of Washington],
)

#cvEntry(
  title: [Fundamentals of Genetics and Genomics],
  society: [Teaching Assistant],
  date: [Summer 2019],
  description: [Lead weekly discussion sections, graded assignments, and held weekly office hours],
  location: [University of Washington],
)
