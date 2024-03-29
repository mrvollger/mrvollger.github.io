---
layout: single
permalink: /software/
author_profile: true
toc: true
toc_label: "Software"
header:
  overlay_image: /assets/images/header.jpg
  overlay_filter: 0.35
  caption: "Photo credit: [Mitchell R. Vollger](https://mrvollger.github.io/)"
  actions:
    - label: "GitHub"
      url: "https://github.com/mrvollger"
title: "Software"

feature_fibertools:

- image_path: "/assets/images/fiber_tools_grey.png"
  alt: ""
  title: "fibertools"
  excerpt: "
The toolkit for processing Fiber-seq data.
[fibertools](https://github.com/fiberseq/fibertools-rs){: .btn .btn--info .btn--large} 
<br/>
"


feature_sda:

- image_path: "/assets/images/SDA.png"
  alt: ""
  title: "Segmental Duplication Assembler (SDA)"
  excerpt: "
Segmental Duplication Assembler ([SDA](https://mrvollger.github.io/SDA/)) is for identifying and resolving collapsed SDs.
<br/>
[SDA](https://mrvollger.github.io/SDA/){: .btn .btn--info .btn--large} 
<br/>
"

feature_rustybam:

- image_path: "/assets/images/rustybam.png"
  alt: ""
  title: "Rustybam"
  excerpt: "
A toolkit for processing alignments. Works well with [SafFire](/software/#visualization).
<br/>
[Rustybam](https://mrvollger.github.io/rustybam/){: .btn .btn--info .btn--large} 
<br/>
"

feature_row1-3:

- image_path: "assets/images/tbc1d3.png"
  alt: ""
  title: "Rhodonite"
  excerpt: "
A modular workflow for sequence masking and annotation.
<br/>
[Rhodonite](https://mrvollger.github.io/Rhodonite/){: .btn .btn--info .btn--large} 
<br/>
"


feature_stainedglass:

- image_path: https://raw.githubusercontent.com/mrvollger/StainedGlass/main/images/chr8.png
  alt: ""
  title: "StainedGlass"
  excerpt: "
  Identity heatmaps from alignments.
  <br/>
  [StainedGlass](https://mrvollger.github.io/StainedGlass/){: .btn .btn--info .btn--large} 
  "


feature_saffire:

- image_path: "/assets/images/SafFire.png"
  alt: ""
  title: "SafFire"
  excerpt: "
SafFire is a tool for visualizing alignments between genomes. It serves as a interactive replacement for miropeats. 
<br/>
[SafFire](https://mrvollger.github.io/SafFire/){: .btn .btn--info .btn--large} 
"


feature_nucfreq:

- image_path: https://raw.githubusercontent.com/mrvollger/NucFreq/master/imgs/image.png
  alt: ""
  title: "NucFreq"
  excerpt: "
Visualize collapses in _de novo_ assemblies.
  <br/>
[NucFreq](https://github.com/mrvollger/NucFreq){: .btn .btn--info .btn--large} 
"

feature_ideogram:

- image_path: 
  alt: ""
  title: "Ideogram"
  excerpt: "
  For visualizing _de novo_ assemblies against a karyotype of the human reference.
  <br/>
  [Ideogram](https://github.com/mrvollger/ideogram){: .btn .btn--info .btn--large} 
  "

feature_smktemplate:

- image_path: 
  alt: ""
  title: "Publication quality Snakemake workflows"
  excerpt: "
A [template](https://mrvollger.github.io/SmkTemplate/) for for publication quality snakemake workflows ([slides](https://mrvollger.github.io/SmkTemplate/slides)).

[SmkTemplate](https://mrvollger.github.io/SmkTemplate/){: .btn .btn--info .btn--large} 
"

---

# Tools

{% include feature_row id="feature_fibertools" type="left" %}

{% include feature_row id="feature_sda" type="right" %}

{% include feature_row id="feature_rustybam" type="left" %}

{% include feature_row id="feature_row1-3" type="right" %}

# Visualization

{% include feature_row id="feature_stainedglass" type="left" %}

{% include feature_row id="feature_saffire" type="right" %}

<!--
<div markdown="0">
  <iframe src="https://mrvollger.github.io/SafFire" width="900" height="450" frameborder="0" scrolling="yes" style="display:block; margin: 0 auto;" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
</div>
-->

{% include feature_row id="feature_nucfreq" type="center" %}

{% include feature_row id="feature_ideogram" type="center" %}

# Tutorials

{% include feature_row id="feature_smktemplate" type="center" %}

<br/>
