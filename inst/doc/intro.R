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

## ----dtorg, fig.cap='Layout for germination evaluation process. The factor column (red) are according the experimental design. The seed number column (green) for the number of seed sown and the evaluation columns (blue) for accounting the germination.',fig.align='center', out.width='100%'----
knitr::include_graphics('files/dtorg.png')

## ----references---------------------------------------------------------------
if(!file.exists("files/pkgs.bib")){write_bib(c(.packages()),'files/pkgs.bib')}

