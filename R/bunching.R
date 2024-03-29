#' bunching: Analyze bunching at a kink or notch
#'

#' The \code{bunching} package implements the bunching estimator in settings with kinks or notches.
#' Given a numeric vector, it allows the user to estimate bunching at a particular location in the vector's distribution, and returns a rich set of results.
#' Important features include functionality for controlling for (different levels of) round numbers, controlling for other bunching points in the bunching bandwidth,
#' and splitting bins using the bunching point as the minimum, median or maximum in its bin for robustness analysis. It estimates standard errors using residual-based bootstrapping,
#' and returns estimated elasticities using both reduced-form and parametric specifications.
#' Besides estimation, it produces bunching plots in the style of Chetty et al. (2011) with lots of functionality for editing the plot's appearance.
#'

#' @section Main functions:
#'
#' \code{bunching} has two main functions:
#' \describe{
#'
#'   \item{\code{\link{bunchit}}}{is the main function that runs all the analysis.}
#'   \item{\code{\link{plot_hist}}}{is a tool for exploratory visualization prior to estimating bunching. It can be used to
#'   decide how to choose the appropriate binwidth, bandwidth, the number around the bunching point to include in the bunching region,
#'   the polynomial order, whether to control for round numbers and other fixed effects in the bandwidth.}
#'
#'}
#'
#' @seealso \code{\link{bunchit}}, \code{\link{plot_hist}}
#'
#' @docType package
#' @name bunching
#'
NULL
