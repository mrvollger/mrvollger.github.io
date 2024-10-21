#import "@preview/brilliant-cv:2.0.3": cvSection, cvEntry, hBar, cvSkill, cvHonor
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

#cvSection("Programming Languages")

#cvSkill(
  type:[Daily Use], 
  info:[Rust #hBar() Python #hBar() R #hBar() Snakemake #hBar() Bash]
)

#cvSkill(
  type:[As needed], 
  info:[C++ #hBar() LaTeX #hBar() typst]
)


#cvSection("Professional Organizations")

#cvSkill(
  info: [Somatic Mosaicism Across Human Tissues consortium (SMaHT)],
  type: [2023-Present],
)


#cvSkill(
  info: [American Society of Human Genetics (ASHG)],
  type: [2021-Present],
)

#cvSkill(
  info: [Telomere to Telomere consortium (T2T)],
  type: [2020-Present],
)

#cvSkill(
  info: [Human Pangenome Reference Consortium (HPRC)],
  type: [2020-Present],
)

#cvSection("References")

#cvSkill(
  info: [
    #link("https://stergachislab.org/")[Andrew B. Stergachis]
    #hBar()
    #link("mailto:absterga@uw.edu")
  ],
  type: "Advisor",
)

#cvSkill(
  info: [
    #link("https://eichlerlab.gs.washington.edu/index.html")[Evan E. Eichler]
    #hBar()
    #link("mailto:eee@gs.washington.edu")
  ],
  type: "Advisor",
)

#cvSkill(
  info: [
    #link("https://genomeinformatics.github.io/")[Adam Phillippy]
    #hBar()
    #link("mailto:adam.phillippy@nih.gov")
  ],
  type: "Collaborator",
)

#cvSkill(
  info: [
    #link("https://noble.gs.washington.edu/")[William Noble]
    #hBar()
    #link("mailto:wnoble@uw.edu")
  ],
  type: "Collaborator",
)

#cvSkill(
  info: [
    #link("https://www.timplab.org/")[Winston Timp]
    #hBar()
    #link("mailto:wtimp@jhu.edu")
  ],
  type: "Collaborator",
)