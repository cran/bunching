% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bin_data.R
\name{bin_data}
\alias{bin_data}
\title{Bin the raw data}
\usage{
bin_data(z_vector, binv = "median", zstar, binwidth, bins_l, bins_r)
}
\arguments{
\item{z_vector}{a numeric vector of (unbinned) data.}

\item{binv}{a string setting location of zstar within its bin ("min", "max" or "median" value). Default is median.}

\item{zstar}{a numeric value for the the bunching point.}

\item{binwidth}{a numeric value for the width of each bin.}

\item{bins_l}{number of bins to left of zstar to use in analysis.}

\item{bins_r}{number of bins to right of zstar to use in analysis.}
}
\value{
\code{bin_data} returns a data frame with bins and corresponding frequencies (counts).
}
\description{
Create data frame of binned counts
}
\examples{
data(bunching_data)
binned_data <- bin_data(z_vector = bunching_data$kink, zstar = 10000,
                        binwidth = 50, bins_l = 20, bins_r = 20)
head(binned_data)
}
\seealso{
\code{\link{bunchit}}
}
