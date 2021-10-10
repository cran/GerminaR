## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")

## ----tabs---------------------------------------------------------------------
table <- "https://docs.google.com/spreadsheets/d/1QziIXGOwb8cl3GaARJq6Ez6aU7vND_UHKJnFcAKx0VI/edit#gid=573661810"

table %>% 
  gsheet2tbl() %>% 
  knitr::kable(caption = 'Description of each module in GerminaQuant to evaluate and analyze the germination process.'
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

