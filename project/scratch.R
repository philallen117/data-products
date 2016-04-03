# scratch - including tests

source("calcs.R")

power(40,0.5,0.05)
effect_size(40,0.93,0.05)
n(0.5,0.93,0.05)

source("pres.R")

summaryString(n=40, effect_size=0.5, alpha=0.05, objective="Power")
summaryString(power=0.93, effect_size=0.5, alpha=0.05, objective="Group size")
summaryString(n=40, power=0.93, alpha=0.05, objective="Effect size")

pow_plot(n=40, effect_size=0.5, alpha=0.05, objective="Power")
pow_plot(power=0.93, effect_size=0.5, alpha=0.05, objective="Group size")
pow_plot(n=40, power=0.93, alpha=0.05, objective="Effect size")


# system.file("examples", package="shiny")
# 
# runExample("01_hello") # a histogram
# runExample("02_text") # tables and data frames
# runExample("03_reactivity") # a reactive expression
# runExample("04_mpg") # global variables
# runExample("05_sliders") # slider bars
# runExample("06_tabsets") # tabbed panels
# runExample("07_widgets") # help text and submit buttons
# runExample("08_html") # Shiny app built from HTML
# runExample("09_upload") # file upload wizard
# runExample("10_download") # file download wizard
# runExample("11_timer") # an automated timer
