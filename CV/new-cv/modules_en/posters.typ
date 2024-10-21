#import "@preview/brilliant-cv:2.0.3": cvSection, cvEntry, hBar
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

#cvSection("Posters")

#cvEntry(
  title: [Fibertools: computational methods for chromatin accessibility with long-reads],
  society: [Genome Sciences Annual Retreat],
  location: [University of Washington],
  date: [September 2022],
  description: none
)

#cvEntry(
  title: [A complete view of segmental duplications and their variation],
  society: [Biology of Genomes],
  location: [Cold Spring Harbor, New York],
  date: [May 2021],
  description: none
)

#cvEntry(
  title: [Improved Assembly of Human Genomes Using HiFi],
  society: [Annual Scientific Meeting, Howard Hughes Medical Institute],
  date: [December 2019],
  location: [Chevy Chase, Maryland],
  description: none
)

#cvEntry(
  title: [Resolving segmental duplications using long reads and correlation clustering],
  society: [Collaborative Seminar Series, Allen Institute, Fred Hutch, and UW Medicine],
  date: [October 2018],
  location: [University of Washington],
  description: none
)

#cvEntry(
  title: [Resolving Segmental Duplications with PSV based Community Detection],
  society: [Genome Sciences Annual Retreat, Washington University],
  date: [September 2017/2018],
  location: [University of Washington],
  description: none
)

#cvEntry(
  title: [Identifying Multiple Charge States of Peptides in Mass Spectrometry],
  society: [NHGRI Annual Meeting],
  date: [April 2017],
  location: [Washington University in St. Louis, Missouri],
  description: none
)