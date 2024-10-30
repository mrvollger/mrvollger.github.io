// Imports
#import "@preview/brilliant-cv:2.0.3": cv
#let metadata = toml("./metadata.toml")
#let importModules(modules, lang: metadata.language) = {
  for module in modules {
    include {
      "modules_" + lang + "/" + module + ".typ"
    }
  }
}

// show the header with metadata
#show: cv.with(
  metadata,
  profilePhoto: image("./src/avatar.png"),
)

//
// some of my custom settings
//
#let highlight_color = rgb(metadata.layout.awesome_color)

// highlight links in blue and underline them if they are not mailto links
// dont want to modify the links in the header
#show link: it => [
  #set text(fill: blue)
  #if it.dest.contains("mailto") [
    #it
  ] else [
    #underline(it)
  ]
]

// Import all the sections
#importModules((
  "education",
  "professional",
  "awards",
  "publications",
  "auto-generated-talks",
  //"posters",
  "teaching",
  "misc",
))
