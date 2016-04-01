library(shiny)
shinyUI(pageWithSidebar(  
  headerPanel("Power Calculator"),  
  sidebarPanel(    
    h2('Big text'),   
    h3('Sidebar')  
  ),  
  mainPanel(      
    h2('Main Panel text')  
  )
))
