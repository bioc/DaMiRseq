% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/test_data.R
\docType{data}
\name{SE}
\alias{SE}
\title{Example gene-expression dataset for DaMiRseq package}
\format{
A SummarizedExperiment object containing an assay of
21363 randomly selected genes (rows) and 40 samples (columns)
and a colData with 5 variables
}
\usage{
SE
}
\value{
An example dataset for \code{DaMiRseq} package
}
\description{
A dataset with count matrix to test several DaMiRseq functions.
To show package functionality in a reasonably execution time,
sample data are a subset of Genotype-Tissue Expression (GTEx)
RNA-Seq database (dbGap Study Accession: phs000424.v6.p1). Samples incude
20 Anterior Cingulate Cortex (ACC) tissues and 20 Frontal Cortex (FC) tissues.
21363 genes have been preaviously selected to have 5 read counts
in at least 60% of samples.
}
\keyword{datasets}
