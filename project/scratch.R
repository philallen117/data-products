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

# p <- pnorm(xitc, mean = effect_size, sd = 1 / sqrt(n), lower.tail = FALSE)
# Try with effect size, and substituting "proper" value
pow_plot <- function(effect_size, n, alpha) {
  g = ggplot(data.frame(effect_size = c(-2, 3)), aes(x = effect_size))
  g = g + stat_function(fun = dnorm, geom = "line", 
                        args = list(mean = 0, sd = 1 / sqrt(n)), 
                        size = 2, col = "red")
  g = g + geom_vline(xintercept = 0, col = "red")
  g = g + stat_function(fun=dnorm, geom = "line", 
                        args = list(mean = effect_size, sd = 1 / sqrt(n)), 
                        size = 2, col = "blue")
  g = g + geom_vline(xintercept = effect_size, col = "blue")
  xitc = qnorm(1 - alpha) / sqrt(n)
  g = g + geom_vline(xintercept = xitc, size = 1)
  p <- power.t.test(n=n, delta=effect_size, sd=1, type="one.sample", alt="one.sided")$power
  g <- g + ggtitle(paste0("Power: ", round(p,3)))
  g <- g + xlab("Effect size")
  g <- g + scale_x_continuous(breaks=c(round(seq(-2,3,0.5),1),xitc,effect_size))
  g
}
pow_plot(0.5,20,0.05)


manipulate(
  pow_plot(effect_size, n, alpha),
  effect_size = slider(0, 2, step = 0.1, initial = 0.5),
  n = slider(1, 50, step = 1, initial = 20),
  alpha = slider(0.01, 0.1, step = 0.01, initial = 0.05)
)


system.file("examples", package="shiny")

runExample("01_hello") # a histogram
runExample("02_text") # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg") # global variables
runExample("05_sliders") # slider bars
runExample("06_tabsets") # tabbed panels
runExample("07_widgets") # help text and submit buttons
runExample("08_html") # Shiny app built from HTML
runExample("09_upload") # file upload wizard
runExample("10_download") # file download wizard
runExample("11_timer") # an automated timer
