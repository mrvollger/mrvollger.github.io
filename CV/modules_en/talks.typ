#import "@preview/brilliant-cv:2.0.3": cvSection, cvEntry, hBar
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

#cvSection("Presentations")

#cvEntry(
  title: [Fiber-seq and tools to understand the regulatory genome in a disease context],
  society: [European Society of Human Genetics (ESHG)],
  location: [Allianz MiCo in Milan, Italy],
  date: [May 2025],
  description: none,
)

#cvEntry(
  title: [Fiber-seq Inferred Regulatory Elements with diploid T2T genomes],
  society: [Telomere-to-telomere face-to-face conference],
  location: [University of California Santa Cruz],
  date: [Summer 2024],
  description: none,
)

#cvEntry(
  title: [Comprehensive diploid genetic and epigenetic profiles with single-molecule precision],
  society: [Division of Medical Genetics Seminar Series],
  location: [University of Washington],
  date: [April 2023],
  description: none,
)

#cvEntry(
  title: [Comprehensive diploid genetic and epigenetic profiles with single-molecule precision],
  society: [AGBT 2023],
  location: [Hollywood, Florida],
  date: [Feb 2023],
  description: none,
)

#cvEntry(
  title: [A complete view of segmental duplications and their variation],
  society: [Genome Sciences 20th anniversary symposium],
  location: [University of Washington],
  date: [Dec 2022],
  description: none,
)

#cvEntry(
  title: [Using a complete human reference to explore variation in segmental duplications],
  society: [Long-Read, Long-Range scientific interest group],
  location: [NHGRI, remote],
  date: [Oct 2022],
  description: none,
)

#cvEntry(
  title: [Increased mutation rate and interlocus gene conversion within human segmental duplications],
  society: [Telomere-to-telomere face-to-face conference],
  location: [University of California Santa Cruz],
  date: [Aug 2022],
  description: none,
)

#cvEntry(
  title: [Segmental duplications and their variation in a complete human genome],
  society: [UCSC BME departmental seminar series],
  location: [University of California Santa Cruz, remote],
  date: [March 2022],
  description: none,
)

#cvEntry(
  title: [Segmental duplications and their variation in a complete human genome],
  society: [NHGRI computational biology seminar series],
  location: [NHGRI, remote],
  date: [Oct 2021],
  description: none,
)

#cvEntry(
  title: [A complete view of segmental duplications and their variation],
  society: [American Society of Human Genetics, Section talk],
  location: [remote],
  date: [Sep 2021],
  description: none,
)

#cvEntry(
  title: [A complete view of segmental duplications and their variation],
  society: [T2T and HPRC conference],
  location: [University of Washington],
  date: [Sep 2020],
  description: none,
)

#cvEntry(
  title: [Improved Assembly of Segmental Duplications Using HiFi],
  society: [Pacific Biosciences User Group Meeting],
  location: [University of Delaware],
  date: [Sep 2019],
  description: none,
)

