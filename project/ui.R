library(shiny)
# idea - try %ages instead
shinyUI(fluidPage(
  titlePanel("Power Calculator"),
  sidebarLayout(
    sidebarPanel( 
      h2("Controls"),
      p("Choose an objective and fill in the known values"),
      selectInput("objective", "Obejctive:", choices = c("Power", "Group size", "Effect size")),
      numericInput("alpha", "Alpha:", value = 0.05, step = 0.01, min = 0.01, max = 0.1),
      div(numericInput("n", "Group size:", value = 20, min = 5)),
      div(numericInput("effect_size", "Effect size:", value = 0.5, step = 0.1, min = 0, max = 2)),
      div(numericInput("power", "Power:", value = 0.8, step = 0.05, min = 0.5, max = 0.95))
    ),  
    mainPanel(      
      strong(textOutput("summary")),
      plotOutput("vis")
    )
  )
))
