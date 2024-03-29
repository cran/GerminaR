% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ger_indices.R
\name{ger_SYN}
\alias{ger_SYN}
\title{Germination Synchronization Index}
\usage{
ger_SYN(evalName, data)
}
\arguments{
\item{evalName}{Prefix of the names of the periods of evaluation.}

\item{data}{The name of the data frame containing the data.}
}
\value{
It returns an vector with the values of Germination synchrony
}
\description{
This function calculates the germination synchronization of the germination process.
}
\details{
The Synchory Index \code{Z} has been proposed to assess the degree of overlap between flowering individuals in a population. 
By adopting the idea expressed by PRIMACK, R.B. (1980) the synchrony of one seed with other included in the same replication. 
\code{Z} = 1 when germination of all the seeds occurs at the same time and \code{Z} = 0 when at least two seeds can germinate one each time. 
\code{Z} produces a number if and only if there are two seeds finishing the seed germination process at the same time. 
Thus, the value of \code{Z} assessments is the grade of overlap between seed germination.
}
\examples{
library(GerminaR)
dfr <- prosopis
syn <- ger_SYN(evalName = "D", data = dfr)
syn
}
\references{
RANAL, M. A.; SANTANA, D. G. DE. How and why to measure the germination process? 
Revista Brasileira de Botanica, v. 29, n. 1, p. 1-11, mar. 2006.
}
