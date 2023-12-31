% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Normalization.R
\name{DaMiR.normalization}
\alias{DaMiR.normalization}
\title{Filter non Expressed and 'Hypervariant' features and Data
Normalization}
\usage{
DaMiR.normalization(
  data,
  minCounts = 10,
  fSample = 0.5,
  hyper = c("yes", "no"),
  th.cv = 3,
  type = c("vst", "rlog", "logcpm"),
  nFitType = c("parametric", "local", "mean")
)
}
\arguments{
\item{data}{A \code{SummarizedExperiment} object}

\item{minCounts}{Minimum reads counts; default is 10}

\item{fSample}{Fraction of samples with \code{minCounts} counts; default
is 0.5}

\item{hyper}{Flag to enable gene filtering by Coefficient of
Variation (CV); default is "yes"}

\item{th.cv}{Threshold of minimum CV to consider a feature 'Hypervariant'
accross samples; default is 3}

\item{type}{Type of normalization to be applied:
\code{varianceStabilizingTransformation}
(\code{vst}), \code{rlog} or \code{logcpm} are allowed; default is "\code{vst}"}

\item{nFitType}{Type of method to estimate the dispersion by vst or
rlog. Default is "parametric".}
}
\value{
A \code{SummarizedExperiment} object which contains a normalized
expression matrix (log2 scale) and the data frame with 'class' and
(optionally) variables.
}
\description{
Features will be firstly filtered based on their
expression value and/or by
 their variability across samples; features will be then normalized.
}
\details{
Before normalization step, this function allows the user to filter
features by:
\itemize{
  \item Expression - Features will be filtered out whether their reads
   count
  do not reach a \code{minCounts} in at least \code{fSample} of samples;
  \item CV - The CV of each feature is individually calculated for each
   sample class.
  Featurers with both class CV greater than \code{th.cv} will be
  discarded.
  Computing a class restricted CV may prevent the removal of hypervariant
  features that
  may be specifically associated with a certain class. This could be
  important, for example, for
  immune genes whose expression under definite conditions may unveil
  peculiar class-gene
  association.
}
Finally, expressed features will be normalized by
\code{varianceStabilizingTransformation}
 (default) or \code{rlog}, both implemented in \code{DESeq2} package.
 We suggest to
 use \code{varianceStabilizingTransformation} to speed up the
 normalization process
 because \code{rlog} is very time-consuming despite the two methods
  produce quite
 similar results.
}
\examples{
# use example data:
data(SE)
# perform normalization on a subset of data:
SE_sub<-SE[1:1000, c(1:3, 21:23)]
data_norm <- DaMiR.normalization(SE_sub, minCounts=10, fSample=0.8,
hyper="yes", th.cv = 2.5)

}
\references{
Michael I Love, Wolfgang Huber and Simon Anders (2014):
Moderated estimation of
 fold change and dispersion for RNA-Seq data with DESeq2. Genome Biology
}
\seealso{
\code{\link{varianceStabilizingTransformation}, \link{rlog} }
}
\author{
Mattia Chiesa, Luca Piacentini
}
