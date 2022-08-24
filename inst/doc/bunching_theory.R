## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(fig.width=4, fig.height = 4, out.width="45%", fig.align="center",
                      echo=FALSE, fig.pos = 'h',
                      collapse = TRUE,
                      comment = "#>"
                      )

## ----setup, include = F-------------------------------------------------------
library(bunching)

## ---- fig.show='hold', fig.cap="\\label{fig:kinklinear}Optimization with Linear Constraints", fig.subcap=c("\\label{fig:kinklinear_constraint}Optimization", "\\label{fig:kinklinear_density}Density")----
knitr::include_graphics(c("bunching_theory_figs/lineartax_budget.pdf", "bunching_theory_figs/lineartax_density.pdf"))

## ---- fig.show="hold", fig.cap="\\label{fig:kinkkinked}Optimization with Kinked Constraints", fig.subcap = c("Optimization", "Density")----
knitr::include_graphics(c("bunching_theory_figs/kink_budget.pdf", "bunching_theory_figs/kink_density.pdf"))

## ---- fig.show="hold", fig.cap="\\label{fig:notch}Optimization with Notched Constraints", fig.subcap = c("Optimization", "Density")----
knitr::include_graphics(c("bunching_theory_figs/notch_budget.pdf","bunching_theory_figs/notch_density.pdf"))

