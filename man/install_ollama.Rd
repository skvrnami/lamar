% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setup.R
\name{install_ollama}
\alias{install_ollama}
\title{Install ollama python package}
\usage{
install_ollama(method = "auto", conda = "auto", pip = TRUE)
}
\arguments{
\item{method}{Installation method. By default, "auto" automatically finds a
method that will work in the local environment. Change the default to force
a specific installation method. Note that the "virtualenv" method is not
available on Windows.}

\item{conda}{The path to a conda executable.
Use "auto" to allow reticulate to automatically find an appropriate conda binary.}

\item{pip}{Boolean; use pip for package installation? This is only relevant when
Conda environments are used, as otherwise packages will be installed from
the Conda repositories.}
}
\description{
Install ollama python package
}
