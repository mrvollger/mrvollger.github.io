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

#let highlight_color = rgb(metadata.layout.awesome_color)

// show the header with metadata
#show: cv.with(
  metadata,
  profilePhoto: image("./src/avatar.png"),
)

// dont want to modify the links in the header
#show link: it => [
  #set text(fill: blue)
  #if it.dest.contains("mailto") [
    #underline(it)
   ] else[
    #it
   ]
]


// Import all the sections
#importModules((
  "education",
  "professional",
  "awards",
  "publications",
  "talks",
  //"posters",
  "teaching",
  "misc",
))
