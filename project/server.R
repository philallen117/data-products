# server.R
library(shiny)
source("calcs.R")
source("pres.R")
shinyServer(
  function(input, output) {
    
    output$summary <- renderText({
      summaryString(n=input$n, 
                    effect_size=input$effect_size, 
                    power= input$power,
                    alpha=input$alpha,
                    objective=input$objective)
    })
    output$vis <- renderPlot({
      pow_plot(n=input$n, 
               effect_size=input$effect_size, 
               power= input$power,
               alpha=input$alpha,
               objective=input$objective)
    })
  }
)
