% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/regression_functions.R
\name{riSynth}
\alias{riSynth}
\title{Randomization Inference on ATT using Synthetic Control}
\usage{
riSynth(data, outcome, treatment, covs, treatment.year, pretreatment.year,
  posttreatment.year = NULL, unit.variable, unit.names.variable,
  time.variable, include.past.Y = TRUE, snowfall = FALSE, maxiter = 1000)
}
\arguments{
\item{data}{a data frame containing the variables in the model}

\item{outcome}{a character. Name of the outcome variable.}

\item{treatment}{a character. Name of the treatment variable.}

\item{covs}{a character vector. Names of the covariates to be used in the
model.}

\item{treatment.year}{the year or time period at which treatment occurs}

\item{pretreatment.year}{the years or time periods before treatment occurs. Observations from these
years or time periods will be used to create the synthetic contorl}

\item{posttreatment.year}{the years or time periods after treatment occurs. Observations form these
years or time periods will be used to calculate treatment effects.}

\item{unit.variable}{A scalar identifying the column number or column-name character string associated unit numbers. The unit.varibale has to be numeric.}

\item{unit.names.variable}{A scalar or column-name character string identifying the column with the names of the units. This variable has to be of mode character. 
  }

\item{time.variable}{A scalar identifying column number or column-name character string associated with period (time) data. The time variable has to be numeric.}

\item{include.past.Y}{a logical; if TRUE past values of the outcomes are included as a covariate
to produce the synthetic control}

\item{snowfall}{a logical; if TRUE the function performs parallel computing
using the snowfall package}

\item{maxiter}{a positive integer. The maximum number of permutations to be
included in the permutation matrix for the randomization distribution. Used
as input for the \code{genperms} function.}
}
\value{
An object of class "riSynth"
}
\description{
Estimates average treatment effect on the treated using the Synthetic Control
Method, then conducts inference using randomization inference by permuting
the treatment vector to obtain the sharp null distribution
}
\details{
Estimates of treatment effects are obtained by the Synthetic Control Method
through the \code{Synthatt} function. The randomization distribution is
obtained by permuting the treatment vector. Internally, \code{riSynth} makes
call to \code{genperms}. It is not yet possible to perform block or clustered
randomization. The arguments \code{treatment.year}, \code{pretreatment.year},
\code{posttreatment.year}, \code{unit.variable}, \code{unit.names.variable},
\code{time.variable}, \code{include.past.Y} are input directly into the call
for \code{Synth::Synth}.

Internally, \code{riSynth} makes use of the \code{Synth} function in the
\code{Synth} package to calculate estimates of the ATT and the \code{permute}
function in the \code{permute} package to create the randomization
distribution. For computers with multiple cores, \code{riSynth} can perform
parallel computation to improve computation speed.
}
