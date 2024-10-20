#import "@preview/brilliant-cv:2.0.3": cvSection, cvEntry, hBar
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

#cvSection("Education")

#cvEntry(
  title: [Ph.D. in Genome Sciences],
  society: [At University of Washington with advisor Evan E. Eichler],
  date: [Sep 2016 - March 2021],
  location: [Seattle, Washington],
  //logo: image("../src/logos/uw.png"),
  description: list(
    //[GPA: 3.86],
    [Dissertation: Assembly of segmental duplications 
and their variation in humans],
  [Completed the #link("https://www.gs.washington.edu/academics/gradprogram/handbook/first/ads.htm")[Advanced Data Sience Option]]
  ),
)

#cvEntry(
  title: [B.S.E. in Computer Science Engineering],
  society: [At Princeton University in the Department of Computer Science],
  date: [Sep. 2011 - June 2015],
  location: [Princeton, New Jersey],
  //logo: image("../src/logos/princeton.png"),
  description: list(
    //[GPA: 3.13],
    [Student of the #link("https://lsi.princeton.edu/integratedscience")[Integrated Science Curriculum]],
   [Certificate in Quantitative and Computational Biology],
    //[GPA: 3.48],
  ),
)

#cvEntry(
  title: [Associate of Arts Degrees],
  society: [College of the Redwoods],
  date: [Sep. 2008 - June 2011],
  location: [Eureka, California],
  //logo: image("../src/logos/redwoods.png"),
  description: list(
    [AA in Mathematics],
    [AA in Science],
    //[GPA: 4.00],
  ),
)
