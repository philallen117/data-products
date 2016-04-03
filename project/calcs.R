# calcs.R
library(ggplot2)
library(scales)

power <- function(n, effect_size, alpha) {
  power.t.test(n=n, delta=effect_size, sig.level=alpha, 
               sd=1, type="one.sample", alt="one.sided")$power
}

effect_size <- function(n, power, alpha) {
  power.t.test(n=n, power=power, sig.level=alpha, 
               sd=1, type="one.sample", alt="one.sided")$delta
}

n <- function(effect_size, power, alpha) {
  round(power.t.test(delta=effect_size, power=power, sig.level=alpha, 
                     sd=1, type="one.sample", alt="one.sided")$n, 0)
}

