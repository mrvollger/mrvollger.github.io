#import "@preview/brilliant-cv:2.0.3": cvSection, cvEntry, hBar, cvSkill, cvHonor
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

#cvSection("Programming Languages")

#cvSkill(
  type:[Daily Use], 
  info:[Rust, Python, R, Snakemake, Bash]
)

#cvSkill(
  type:[As needed], 
  info:[C++, LaTeX]
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
  info: link("https://stergachislab.org/")[Andrew B. Stergachis],
  type: link("mailto:absterga@uw.edu"),
)

#cvSkill(
  info: link("https://eichlerlab.gs.washington.edu/index.html")[Evan E. Eichler],
  type: link("mailto:eee@gs.washington.edu"),
)

#cvSkill(
  info: link("https://genomeinformatics.github.io/")[Adam Phillippy],
  type: link("mailto:adam.phillippy@nih.gov"),
)

#cvSkill(
  info: link("https://noble.gs.washington.edu/")[William Noble], 
  type: link("mailto:wnoble@uw.edu"),
)

#cvSkill(
  info: link("https://www.timplab.org/")[Winston Timp],
  type: link("mailto:wtimp@jhu.edu"),
)