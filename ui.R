shinyUI(fluidPage(
  titlePanel("Palkintorahojen jako heittueiden kesken"),  
  fluidRow(  
    
    column(12, 
           numericInput("heittueidenlkm", 
                        label = h3("Heittueiden lukumäärä"), 
                        value = 1))    
    
  ),
  fluidRow(       
    
    column(12, 
           numericInput("palkintopotti", 
                        label = h3("Palkintopotti"), 
                        value = 0))  
  ),
  fluidRow(       
    column(12, 
           numericInput("osallistumismaksu", 
                        label = h3("Osallistumismaksu"), 
                        value = 2))     
  ),
  hr(),
  fluidRow(
    column(12,
           radioButtons("radio", label = h3("Jakotapa"),
                        choices = list("Tasavälinen" = 1,
                                       "Suhteellinen" = 2),selected = 1))
  ),
  hr(),
  fluidRow(
    column(12,
  actionButton("goButton", "Laske"))
  ),
  br(),
  br(),
  tableOutput(outputId = "value")
))