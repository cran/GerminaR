## ----setup, include=FALSE-----------------------------------------------------
source("http://inkaverse.com/docs.r")

## -----------------------------------------------------------------------------
url <- "https://docs.google.com/spreadsheets/d/1QziIXGOwb8cl3GaARJq6Ez6aU7vND_UHKJnFcAKx0VI/edit#gid=783977038"

url %>% 
  gsheet2tbl() %>% 
kable(caption = "Germination variables evaluated in GerminaR package and limits according to Ranal and Santana (2006), where $n_i$ is the number of seeds germinated in $i^{th}$ time; and $k$ is the last day of the evaluation process for germination")

## ----dtorg, fig.cap='Layout for germination evaluation process. The factor column (red) are according the experimental design. The seed number column (green) for the number of seed sown and the evaluation columns (blue) for accounting the germination.',fig.align='center', out.width='100%'----
knitr::include_graphics('files/dtorg.png')

## ----references---------------------------------------------------------------
if(!file.exists("files/pkgs.bib")){write_bib(c(.packages()),'files/pkgs.bib')}

