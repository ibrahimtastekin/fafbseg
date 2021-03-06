% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{simple_python}
\alias{simple_python}
\title{Simple Python installation for use with R/fafbseg/FlyWire}
\usage{
simple_python(
  pyinstall = c("basic", "full", "cleanenv", "blast", "none"),
  pkgs = NULL,
  miniconda = TRUE
)
}
\arguments{
\item{pyinstall}{Whether to do a \code{"basic"} install (enough for most
functionality) or a \code{"full"} install, which includes tools for
skeletonising meshes. \code{"cleanenv"} will show you how to clean up your
Python enviroment removing all packages. \code{"blast"} will show you how
to completely remove your dedicated miniconda installation. Choosing
what="none" skips update/install of Python and recommended packages only
installing extras defined by \code{pkgs}.}

\item{pkgs}{Additional python packages to install.}

\item{miniconda}{Whether to use the reticulate package's default approach of
a dedicated python for R based on miniconda (recommended, the default) or
to allow the specification of a different system installed Python via the
\code{RETICULATE_PYTHON} environment variable.}
}
\description{
Installs Python via an isolated miniconda environment as well as
  recommended packages for fafbseg. If you absolutely do not want to use
  miniconda (it is much simpler to get started) please read the Details
  section.
}
\details{
The recommended Python install procedure installs a miniconda Python
  distribution. This will not be added to your system \code{PATH} by default
  and can be used exclusively by R. If you do not want to use miniconda, then
  you should at least a) make a Python virtual environment using virtualenv
  (or conda if you are managing your own conda install) and b) specify which
  Python you want to use with the \code{RETICULATE_PYTHON} environment
  variable. You can set \code{RETICULATE_PYTHON} with
  \code{usethis::edit_r_environ()}. If this sounds complicated, we suggest
  sticking to the default \code{miniconda=TRUE} approach.

  Note that that after installing miniconda Python for the first time or
  updating your miniconda install, you will likely be asked to restart R.
  This is because you cannot restart the Python interpreter linked to an R
  session. Therefore if Python was already running in this session, you must
  restart R to use your new Python install.
}
\examples{
\dontrun{
# just the basics
simple_python("basic")
# if you want to skeletonise meshes
simple_python("full")

# To install a special package using the recommended approach
simple_python(pkgs="PyChunkedGraph")
# the same but without touching Python itself or the recommended packages
simple_python('none', pkgs='PyChunkedGraph')

# install a specific version of cloud-volume package
simple_python('none', pkgs='cloud-volume~=3.8.0')

# install all recommended packages but use your existing Python
# only do this if you know what you are doing ...
simple_python("full", miniconda=FALSE)
}
}
