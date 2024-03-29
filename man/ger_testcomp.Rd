% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ger_testcomp.R
\name{ger_testcomp}
\alias{ger_testcomp}
\title{Multiple comparison test}
\usage{
ger_testcomp(aov, comp, type = "snk", sig = 0.05)
}
\arguments{
\item{aov}{lm o aov result function.}

\item{comp}{treatments will be compared.}

\item{type}{method for made comparison analysis: c("snk", "tukey", "duncan").}

\item{sig}{significance level. Default 0.05}
}
\value{
Table with complete data for graphics
}
\description{
Function analysis of variance for summary data.
}
\examples{
 

\dontrun{

library(GerminaR)
library(dplyr)

gdata <- prosopis \%>\% mutate(across(c(nacl, temp, rep), as.factor))

smr <- ger_summary(SeedN = "seeds", evalName = "D", data = gdata)

av <- aov(grp ~ rep + nacl*temp, smr)

mc <- ger_testcomp(aov = av
                   , comp = c("nacl", "temp")
                   )
                   
} 
}
