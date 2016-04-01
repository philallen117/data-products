# scratch for power
library(manipulate)
library(ggplot2)
mu0 = 30
myplot <- function(sigma, mua, n, alpha){
  g = ggplot(data.frame(mu = c(27, 36)), aes(x = mu))
  g = g + stat_function(fun=dnorm, geom = "line", 
                        args = list(mean = mu0, sd = sigma / sqrt(n)), 
                        size = 2, col = "red")
  g = g + stat_function(fun=dnorm, geom = "line", 
                        args = list(mean = mua, sd = sigma / sqrt(n)), 
                        size = 2, col = "blue")
  xitc = mu0 + qnorm(1 - alpha) * sigma / sqrt(n)
  g = g + geom_vline(xintercept=xitc, size = 3)
  p <- pnorm(xitc, mean=mua, sd=sigma, lower.tail = FALSE)
  g <- g + ggtitle(paste0("power: ", round(p,3)))
  g
}
manipulate(
  myplot(sigma, mua, n, alpha),
  sigma = slider(1, 10, step = 1, initial = 4),
  mua = slider(30, 35, step = 1, initial = 32),
  n = slider(1, 50, step = 1, initial = 16),
  alpha = slider(0.01, 0.1, step = 0.01, initial = 0.05)
)

# Try with effect size, and substituting "proper" value
myplot <- function(effect_size, n, alpha){
  g = ggplot(data.frame(effect_size = c(-2, 3)), aes(x = effect_size))
  g = g + stat_function(fun=dnorm, geom = "line", 
                        args = list(mean = 0, sd = 1 / sqrt(n)), 
                        size = 2, col = "red")
  g = g + stat_function(fun=dnorm, geom = "line", 
                        args = list(mean = effect_size, sd = 1 / sqrt(n)), 
                        size = 2, col = "blue")
  xitc = qnorm(1 - alpha) / sqrt(n)
  g = g + geom_vline(xintercept=xitc, size = 1)
  # p <- pnorm(xitc, mean = effect_size, sd = 1 / sqrt(n), lower.tail = FALSE)
  p <- power.t.test(n=n, delta=effect_size, sd=1, type="one.sample", alt="one.sided")$power
  g <- g + ggtitle(paste0("power: ", round(p,3)))
  g
}
manipulate(
  myplot(effect_size, n, alpha),
  effect_size = slider(0, 2, step = 0.1, initial = 0.5),
  n = slider(1, 50, step = 1, initial = 20),
  alpha = slider(0.01, 0.1, step = 0.01, initial = 0.05)
)

# 
