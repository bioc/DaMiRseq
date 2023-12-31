% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Classif_2_Classes_Training.R
\name{DaMiR.EnsL_Train}
\alias{DaMiR.EnsL_Train}
\title{Train a Binary Classifier using 'Staking' Learning strategy.}
\usage{
DaMiR.EnsL_Train(
  data,
  classes,
  variables,
  fSample.tr.w = 0.7,
  cl_type = c("RF", "SVM", "LDA", "LR", "NB", "NN", "PLS")
)
}
\arguments{
\item{data}{A SummarizedExperiment object or a data frame/matrix
of normalized expression data. Rows and Cols should be
observations and features, respectively.}

\item{classes}{A class vector with \code{nrow(data)} elements.
Each element represents the class label for each observation.
Two different class labels are allowed. Note. this argument should
not be set when 'data' is a SummarizedExperiment object}

\item{variables}{An optional data frame containing other variables
(but without 'class' column). Each column represents a different
covariate to be considered in the model}

\item{fSample.tr.w}{Fraction of samples of training set to be used
during weight estimation; default is 0.7}

\item{cl_type}{List of weak classifiers that will compose the
meta-learners. "RF", "SVM", "LDA", "LR", "NB", "NN", "PLS"
are allowed. Default is c("RF", "LR", "LDA", "NB", "SVM")}
}
\value{
A list containing:
\itemize{
  \item The models of each classifier used to build the Ensemble
  meta-learner with the median or the best accuracy
  (over the iteration) for the Ensemble classifier;
  \item the weights associated to each weak classifier;
}
}
\description{
This function learn a meta learner by a 'Stacking'
strategy.
Users can provide heterogeneous features
(other than genomic features)
which will be taken into account during
classification model building. A 'two-classes' classification task
 isaddressed.
}
\details{
This function implements the training step of
\link{DaMiR.EnsembleLearning2cl} function
}
\examples{
# use example data:
data(selected_features)
data(df)
set.seed(1)
# For the example:
# speed up the process setting a low 'iter' argument value;
# for real data set use default 'iter' value (i.e. 100) or higher:
#  Classification_res <- DaMiR.EnsL_Train(
#  selected_features,classes=df$class, fSample.tr.w=0.6, iter=3,
# cl_type=c("RF","LR"))

}
\author{
Mattia Chiesa, Luca Piacentini
}
