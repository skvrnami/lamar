ollama <- NULL

#' Load ollama python binding
#'
#' @param libname Library name
#' @param pkgname Package name
.onLoad <- function(libname, pkgname) {
    ollama <<- reticulate::import("ollama", delay_load = TRUE)
}

#' Install ollama python package
#'
#' @param method Installation method. By default, "auto" automatically finds a
#' method that will work in the local environment. Change the default to force
#' a specific installation method. Note that the "virtualenv" method is not
#' available on Windows.
#' @param conda The path to a conda executable.
#' Use "auto" to allow reticulate to automatically find an appropriate conda binary.
#' @param pip Boolean; use pip for package installation? This is only relevant when
#' Conda environments are used, as otherwise packages will be installed from
#' the Conda repositories.
#' @export
install_ollama <- function(method = "auto", conda = "auto", pip = TRUE) {
    reticulate::py_install("ollama", method = method, conda = conda, pip = pip)
}
