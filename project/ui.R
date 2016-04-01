library(shiny)
# idea - try %ages instead
shinyUI(pageWithSidebar(  
  headerPanel("Power Calculator"),  
  sidebarPanel(    
    h2('Controls'),
    numericInput("alpha", "Alpha:", value = 0.05, step = 0.01, min = 0.01, max = 0.1),
    selectInput("objective", "Calculate:", 
                choices = c("Power", "Group size", "Effect size")),
    numericInput("power", "Power:", value = 0.8, step = 0.05, min = 0.5, max = 0.95),
    numericInput("n", "Group size:", value = 20, min = 5),
    numericInput("effect_size", "Effect size:", value = 0.5, step = 0.1, min = 0, max = 2)
  ),  
  mainPanel(      
    h2('Main Panel text')  
  )
))
