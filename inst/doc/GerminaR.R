## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")

## ----echo=TRUE----------------------------------------------------------------
# Install packages and dependencies

library(GerminaR)

# load data

fb <- prosopis

# Prosopis data set

fb %>% 
   head(10) %>% 
   kable(caption = "Prosopis dataset")

## ----echo=TRUE----------------------------------------------------------------

# germination analysis (ten variables)

gsm <- ger_summary(factors = c("rep", "nacl", "temp")
                   , SeedN = "seeds"
                   , evalName = "D"
                   , cumulative = FALSE
                   , data = fb
                   )

# Prosopis data set processed

gsm %>% 
  head(10) %>% 
  mutate(across(where(is.numeric), ~round(., 2))) %>% 
  kable(caption = "Function ger_summary performe ten germination indices")


## ----echo=TRUE, fig.cap="Germination  experiment with *Prosopis juliflor* under different osmotic potentials and temperatures. Bar graph with germination percentage in a factorial analisys"----

## Germination Percentage (GRP)

# analysis of variance

av <- aov(grp ~ nacl*temp + rep, data = gsm)

# mean comparison test

mc_grp <- ger_testcomp(aov = av
                       , comp = c("temp", "nacl")
                       , type = "snk"
                       )

# data result

mc_grp$table %>% 
   kable(caption = "Germination percentage mean comparision")

# bar graphics for germination percentage

grp <- mc_grp$table %>% 
   fplot(data = .
       , type = "bar"
       , x = "temp"
       , y = "grp"
       , group = "nacl"
       , ylimits = c(0, 140, 30)
       , ylab = "Germination ('%')"
       , xlab = "Temperature"
       , glab = "NaCl (MPa)"
       , error = "ste"
       , sig = "sig"
       , color = F
       )

grp

## ----echo=TRUE, fig.cap="Germination  experiment with *Prosopis juliflor* under different osmotic potentials and temperatures. Bar graph for mean germination time in a factorial analisys."----

## Mean Germination Time (MGT)

# analysis of variance

av <- aov(mgt ~ nacl*temp + rep, data = gsm)

# mean comparison test

mc_mgt <- ger_testcomp(aov = av
                       , comp = c("temp", "nacl")
                       , type = "snk")

# data result

mc_mgt$table %>% 
   kable(caption = "Mean germination time comparison")

# bar graphics for mean germination time

mgt <- mc_mgt$table %>% 
   fplot(data = .
       , type = "bar" 
       , x = "temp"
       , y = "mgt"
       , group = "nacl"
       , ylimits = c(0,10, 1)
       , ylab = "Mean germination time (days)"
       , xlab = "Temperature"
       , glab = "NaCl (MPa)"
       , sig = "sig"
       , error = "ste"
       , color = T
       )

mgt

## ----echo=TRUE, fig.cap="Germination  experiment with *Prosopis juliflor* under different osmotic potentials and temperatures. Line graph from cumulative germination under different osmotic potentials."----

# data frame with percentage or relative germination in time by NaCl

git <- ger_intime(Factor = "nacl"
                  , SeedN = "seeds"
                  , evalName = "D"
                  , method = "percentage"
                  , data = fb
                  )

# data result

git %>% 
   head(10) %>% 
   kable(caption = "Cumulative germination by nacl factor")

# graphic germination in time by NaCl

nacl <- git %>% 
   fplot(data = .
        , type = "line"
        , x = "evaluation"
        , y = "mean"
        , group = "nacl"
        , ylimits = c(0, 110, 10)
        , ylab = "Germination ('%')"
        , xlab = "Day"
        , glab = "NaCl (MPa)"
        , color = T
        , error = "ste"
        )
nacl


## ----echo=TRUE, fig.cap="Germination  experiment with *Prosopis juliflor* under different osmotic potentials and temperatures. Line graph from cumulative germination under different temperatures."----

# data frame with percentage or relative germination in time by temperature

git <- ger_intime(Factor = "temp"
                  , SeedN = "seeds"
                  , evalName = "D"
                  , method = "percentage"
                  , data = fb) 

# data result

git %>% 
   head(10) %>% 
   kable(caption = "Cumulative germination by temperature factor")

# graphic germination in time by temperature

temp <- git %>% 
   fplot(data = .
        , type = "line"
        , x = "evaluation"
        , y = "mean"
        , group = "temp"
        , ylimits = c(0, 110, 10)
        , ylab = "Germination ('%')"
        , xlab = "Day"
        , glab = "Temperature"
        , color = F
        ) 
temp

## ----echo=TRUE----------------------------------------------------------------

library(ggplot2)

git <- ger_intime(Factor = "temp"
                  , SeedN = "seeds"
                  , evalName = "D"
                  , method = "percentage"
                  , data = fb
                  ) 

ggplot <- git %>% 
   fplot(data = .
        , type = "line"
        , x = "evaluation"
        , y = "mean"
        , group = "temp"
        , ylimits = c(0, 110, 10)
        , ylab = "Germination ('%')"
        , xlab = "Day"
        , glab = "Temperature"
        , color = T
        ) +
  scale_x_continuous(n.breaks = 10, limits = c(0, 11)) 

ggplot

## ----references---------------------------------------------------------------
if(!file.exists("files/pkgs.bib")){write_bib(c(.packages()),'files/pkgs.bib')}

