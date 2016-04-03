# pres.R
source("calcs.R")

summaryString <- function(n=NULL, effect_size=NULL, power=NULL, alpha, objective=NULL) {
  if(objective == "Group size") {
    nn <- n(effect_size, power, alpha)
    return(paste0("With effect size ", effect_size, 
                  " for power ", percent(power),
                  " you need group size ", nn
    ))
  }
  if(objective == "Effect size") {
    e <- effect_size(n, power, alpha)
    return(paste0("With group size ", n, 
                  " at power of ", percent(power), 
                  " you will detect an effect size of ", round(e,2)
    ))
  }
  if(objective == "Power") {
    p <- power(n, effect_size, alpha)
    return(paste0("With group size ", n, 
                  " and effect size ", effect_size, 
                  " power is ", percent(p)
    ))
  }
  stop("Error: no matching objective ", objective)
}

pow_plot <- function(n=NULL, effect_size=NULL, power=NULL, alpha, objective) {
  if(objective == "Group size") {
    power <- power(n=n, effect_size=effect_size, alpha=alpha)
  }
  else { 
    if(objective == "Effect size") {
      
    }
    else {
      if(objective == "Power") {
        
      }
      else {
        stop("Unmatched objective ", objective)
      }
      
    }
  }
  
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
  g <- g + xlab("Effect size") + ylab("Probability density")
  # g <- g + scale_x_continuous(breaks=c(round(seq(-2,3,0.5),1),xitc,effect_size))
  g
}

