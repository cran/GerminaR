## ----setup, include=FALSE-----------------------------------------------------
library(shiny)
library(knitr)

knitr::opts_chunk$set(
    fig.align = "center" # Center images in the export file
  , out.width = "98%" # Figure width in html
  , echo = FALSE # Avoid print code in the export file
  , message = FALSE # Avoid print messages in the export file
  , warning = FALSE # Avoid print messages in the export file
  , collapse = TRUE
  , comment = "#>"
  )

options(
    OutDec= "." # Use "." instead of "," in the decimal values
  , scipen = 99 # Avoid use "6e-04"
  , knitr.kable.NA = "" # NA values will appear as empty cell
  , knitr.table.format = "pipe" # Format for export tables
  , citr.use_betterbiblatex = FALSE # For zotero addin 
  ) 

## ----echo=FALSE---------------------------------------------------------------
HTML('

<div id=footer style="width:100%; margin:auto;">

<div style="display:inline-block; width:32%">
<p style="text-align:center">
<a target="_blank" href="https://CRAN.R-project.org/package=GerminaR"><img src="https://flavjack.github.io/GerminaR/reference/figures/logo.png" style="height:70px" title="R cran" alt="GerminaR"></a> 
<span style="display:block;"><small>GerminaR</small></span>
</p></div>

<div style="display:inline-block; width:32%">
<p style="text-align:center">
<a target="_blank" href="https://flavjack.github.io/GerminaR/"><img src="https://pkgdown.r-lib.org/reference/figures/logo.png" style="height:70px" title="GerminaR" alt="GerminaR"></a> 
<span style="display:block;"><small>Project</small></span>
</p></div>

<div style="display:inline-block; width:32%">
<p style="text-align:center">
<a target="_blank" href="https://flavjack.shinyapps.io/germinaquant/"><img src="https://flavjack.github.io/GerminaR/reference/figures/germinaquant.png" style="height:70px" title="GerminaQuant" alt="GerminaQuant for R"></a>
<span style="display:block;"><small>GerminaQuant</small></span>
</p></div>

</div>

')

## ----dtorg, fig.cap='Layout for germination evaluation process. The factor column (red) are according the experimental design. The seed number column (green) for the number of seed sown and the evaluation columns (blue) for accounting the germination.',fig.align='center', out.width='100%'----
knitr::include_graphics('files/dtorg.png')

## ----tabs---------------------------------------------------------------------
tab <- data.frame( 
  
"Tabs" = c(
  "Presentation",
  "User Manual",
  "Fieldbook",
  "Germination",
  "Boxplot",
  "Statistics",
  "Graphics",
  "InTime",
  "Tools"),

"Description" = c(
  'Presentation of the application, principal characteristics and contributors',
  "User manual explain the meaning of each index and how to collect and process your data",
  "Interface to upload the field book and choose the parameter for the germination analysis, GerminaQuant allows to upload the data from google sheet or excel file",
  "Calculate automatically the germination variables and export the data file.",
  "Interface to explore your data and their distribution",
  "Interface to choose the variables according the experimental design for analysis of variance and summarize the information according the principal mean comparison test",
  "Graphic the mean comparison test for the variables selected in the statistical analysis and plot the information in customized bar or line plot.",
  "Selecting the factor from your experiment, allows plotting the germination process in time.",
  "Tool for calculate the osmotic potential for any salt or PEG for germination experiments")
  
)

knitr::kable(
  tab, 
  booktabs = TRUE,
  caption = 'Name and description of each tab of GerminaQuant to evaluate and analyze the germination process.'
  )

## ----impdt, out.width='100%', fig.cap= "Fieldbook interface for import your data", fig.align='center'----
knitr::include_graphics('files/impdt.png')

## ----dwl, fig.cap='Dowload option for the calculated variables', fig.align='center',out.width='100%'----
knitr::include_graphics('files/dtdown.png')

## ----stat,  fig.cap="Statitical analysis with ANOVA and mean comparison test", fig.align='center', out.width='100%'----
knitr::include_graphics('files/stat.png')

## ----plot,  fig.cap="Customized interface for bar or line plot", fig.align='center', out.width='100%'----
knitr::include_graphics('files/plot.png')

## ----gtime,  fig.cap='Germination in time plot', fig.align='center', out.width='100%'----
knitr::include_graphics('files/gtime.png')

## ----references---------------------------------------------------------------
if(!file.exists("files/pkgs.bib")){write_bib(c(.packages()),'files/pkgs.bib')}

