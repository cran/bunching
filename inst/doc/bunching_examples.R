## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(fig.width=4.5, fig.height = 3.5, fig.align = "center", 
                      fig.show = "hold", out.width = "50%",
                      collapse = TRUE,
                      comment = "#>")

library(bunching)

## ---- out.width = "40%"-------------------------------------------------------
data(bunching_data)

plot_hist(z_vector = bunching_data$kink_vector, 
          zstar = 10000, binwidth = 50, 
          bins_l = 40, bins_r = 40,
          p_title = "Kink", p_title_size = 11)$plot

plot_hist(z_vector = bunching_data$notch_vector, 
          zstar = 10000, binwidth = 50, 
          bins_l = 40, bins_r = 40,
          p_title = "Notch", p_title_size = 11)$plot


## -----------------------------------------------------------------------------
kink1 <- bunchit(z_vector = bunching_data$kink, zstar = 10000, binwidth = 50, 
                 bins_l = 20, bins_r = 20, poly = 4, t0 = 0, t1 = .2, 
                 p_title = "Kink analysis")
# return plot
kink1$plot

## -----------------------------------------------------------------------------
# Bunching mass
kink1$B
# Normalized bunching mass
kink1$b
# Elasticity
kink1$e

## -----------------------------------------------------------------------------
kink1_param <- bunchit(z_vector = bunching_data$kink, zstar = 10000, binwidth = 50, 
                       bins_l = 20, bins_r = 20, poly = 4, t0 = 0, t1 = .2,
                       p_b = TRUE, p_e = TRUE, p_b_e_ypos = 870,  seed = 1,
                       p_title = "Kink with b and e estimates on plot")
kink1_param$plot

## -----------------------------------------------------------------------------
kink1_no_corr <- bunchit(z_vector = bunching_data$kink, zstar = 10000, binwidth = 50, 
                         bins_l = 20, bins_r = 20, poly = 4, t0 = 0, t1 = .2,
                         p_b = TRUE, p_e = TRUE, p_b_e_ypos = 870,  seed = 1,
                         correct = FALSE,
                         p_title = "Kink without integration constraint correction")
kink1_no_corr$plot

## -----------------------------------------------------------------------------
# create diffuse bunching
bpoint <- 10000; binwidth <- 50
kink2_vector <- c(bunching_data$kink_vector, 
                  rep(bpoint - binwidth,80), rep(bpoint - 2*binwidth,190),
                  rep(bpoint + binwidth,80), rep(bpoint + 2*binwidth,80))
# visualization
plot_hist(z_vector = kink2_vector, zstar = 10000, binwidth = 50, 
          bins_l = 20, bins_r = 20,  p_title = "Distribution with diffuse bunching")$plot

## -----------------------------------------------------------------------------
kink2 <- bunchit(z_vector = kink2_vector, zstar = 10000, binwidth = 50, 
                 bins_l = 20, bins_r = 20, poly = 4,  t0 = 0, t1 = .2,
                 bins_excl_l = 2, bins_excl_r = 2, correct = FALSE, 
                 p_b = TRUE, p_e = TRUE, p_b_e_ypos = 870, 
                 p_title = "Kink with diffuse bunching")
kink2$plot

## -----------------------------------------------------------------------------
# create round number bunching
rn1 <- 500; rn2 <- 250; bpoint <- 10000
kink3_vector <- c(bunching_data$kink_vector,
                  rep(bpoint + rn1, 270),rep(bpoint + 2*rn1,230),
                  rep(bpoint - rn1,260), rep(bpoint - 2*rn1,275),
                  rep(bpoint + rn2, 130), rep(bpoint + 3*rn2,140), 
                  rep(bpoint - rn2,120), rep(bpoint - 3*rn2,135))
plot_hist(z_vector = kink3_vector, zstar = 10000, binwidth = 50,
          bins_l = 20, bins_r = 20, p_freq_msize = 1.5,
          p_title = "Distribution with round number bunching")$plot

## -----------------------------------------------------------------------------
kink3_rn<- bunchit(z_vector = kink3_vector, zstar = 10000, binwidth = 50,
                   bins_l = 20, bins_r = 20, poly = 4, t0 = 0, t1 = .2, 
                   correct = FALSE, p_b = TRUE, seed = 1, rn = c(250,500),
                   p_title = "Kink controlling for round numbers")
kink3_rn$plot

## -----------------------------------------------------------------------------
kink3_no_rn <- bunchit(z_vector = kink3_vector, zstar = 10000, binwidth = 50,
                       bins_l = 20, bins_r = 20, poly = 4,  t0 = 0, t1 = .2, 
                       correct = FALSE, p_b = TRUE, seed = 1,
                       p_title = "Kink not controlling for round numbers")
kink3_no_rn$plot

## -----------------------------------------------------------------------------
# create extra bunching mass
kink4_vector <- c(bunching_data$kink_vector, rep(10200,540))
plot_hist(z_vector = kink4_vector, zstar = 10000, binwidth = 50,
          bins_l = 40, bins_r = 40, p_freq_msize = 1.5,
          p_title = "Distribution with extra bunching mass in bandwidth")$plot

## -----------------------------------------------------------------------------
kink4_fe <- bunchit(z_vector = kink4_vector, zstar = 10000, binwidth = 50,
                    bins_l = 40, bins_r = 40, poly = 6, t0 = 0, t1 = .2, 
                    bins_excl_l = 0, bins_excl_r = 0, correct = FALSE, 
                    p_b = TRUE, extra_fe = 10200,
                    p_title = "Kink controlling for extra mass")
kink4_fe$plot

## -----------------------------------------------------------------------------
kink4_fe_corrected <- bunchit(z_vector = kink4_vector, zstar = 10000, binwidth = 50,
                       bins_l = 40, bins_r = 40, poly = 6,  t0= 0 , t1 = .2, 
                       correct = TRUE, p_b=TRUE, extra_fe = 10200, seed = 1,
                       p_title = "Kink controlling for extra mass with correction")
kink4_fe_corrected$plot

## -----------------------------------------------------------------------------
kink4_no_fe <- bunchit(z_vector = kink4_vector, zstar = 10000, binwidth = 50,
                       bins_l = 40, bins_r = 40, poly = 6, t0= 0 , t1 = .2, 
                       correct = TRUE, p_b=TRUE, seed = 1,
                       p_title = "Kink not controlling for extra mass with correction")
kink4_no_fe$plot

## -----------------------------------------------------------------------------
plot_hist(z_vector = bunching_data$kink, zstar = 10000, binv = "max", 
          binwidth = 100, bins_l = 20, bins_r = 20, 
          p_title = "Distribution from grouping zstar to be max in bin")$plot

## -----------------------------------------------------------------------------
kink5 <- bunchit(z_vector = bunching_data$kink, zstar = 10000, binv = "max", 
                 binwidth = 100, bins_l = 20, bins_r = 20, bins_excl_r = 1,
                 poly  = 6, t0 = 0, t1 = .2, p_b = TRUE, seed = 1, 
                 p_title = "Kink with diffuse bunching and zstar max in bin")
kink5$plot

## -----------------------------------------------------------------------------
plot_hist(z_vector = bunching_data$notch_vector, zstar = 10000, binwidth = 50, 
          bins_l = 40, bins_r = 40, p_title = "Notch Example")$plot

## -----------------------------------------------------------------------------
notch1 <- bunchit(z_vector = bunching_data$notch_vector, zstar = 10000, binwidth = 50, 
                  bins_l = 40, bins_r = 40, poly = 5, t0=0.18, t1=.25, correct = FALSE, 
                  notch = TRUE, p_b = TRUE, p_b_e_xpos = 9000, seed = 1,
                  p_title = "Notch without correction")
notch1$plot

## -----------------------------------------------------------------------------
# zD
notch1$zD
# zD_bin
notch1$zD_bin
# alpha
notch1$alpha

## -----------------------------------------------------------------------------
notch2 <- bunchit(z_vector = bunching_data$notch_vector, zstar = 10000, binwidth = 50, 
                  bins_l = 40, bins_r = 40, poly = 4, t0=0.18, t1=.25, correct = TRUE, 
                  notch = TRUE, p_b = TRUE, p_b_e_xpos = 9000, seed = 1,
                  p_title = "Notch with correction from zstar")
notch2$plot

## -----------------------------------------------------------------------------
notch3 <- bunchit(z_vector = bunching_data$notch_vector, zstar = 10000, binwidth = 50, 
                  bins_l = 40, bins_r = 40, poly = 5, t0=0.18, t1=.25,  correct = TRUE, 
                  notch = TRUE, correct_above_zu = TRUE, p_b = TRUE, p_b_e_xpos = 9000,
                  seed = 1, p_title = "Notch with correction from zU")
notch3$plot

## -----------------------------------------------------------------------------
kink_p <- bunchit(z_vector = bunching_data$kink, zstar = 10000, binwidth = 50, 
                  bins_l = 20, bins_r = 20, poly = 4, t0 = 0, t1 = .2, 
                  p_title = "Kink analysis", p_xtitle = "Earnings", p_ytitle = "Bin Count",
                  p_title_size = 15, p_axis_title_size = 13, p_axis_val_size = 11, 
                  p_grid_major_y_color = "white",  p_cf_color =  "red", 
                  p_freq_color = "#1A476F", p_freq_size = .8, p_zstar_color = "black",
                  p_freq_msize = 1.5, p_miny = 200, p_maxy = 1200, p_ybreaks = c(500,1000), 
                  p_b = TRUE, p_b_e_size = 5, p_b_e_xpos = 9500, p_b_e_ypos = 1000, 
                  seed = 1)
kink_p$plot

## -----------------------------------------------------------------------------
notch_p <- bunchit(z_vector = bunching_data$notch_vector, zstar = 10000, binwidth = 50, 
                   bins_l = 40, bins_r = 40, poly = 5, t0=0.18, t1=.25, correct = FALSE, 
                   notch = TRUE, p_title = "Notch without correction",
                   p_xtitle = "Earnings", p_ytitle = "Bin Count",
                   p_title_size = 15, p_axis_title_size = 13, p_axis_val_size = 11, 
                   p_grid_major_y_color = "white",  p_cf_color =  "red", 
                   p_freq_color = "#1A476F", p_freq_size = .8, p_zstar_color = "black",
                   p_freq_msize = 1.5, p_maxy = 2500, p_ybreaks = c(1000,2000), 
                   p_b = TRUE, p_b_e_size = 5, p_b_e_xpos = 8700, p_b_e_ypos = 1500, 
                   seed = 1, p_domregion_color = "black", p_domregion_ltype = "dotted")
notch_p$plot

