shinyServer(function(input, output) {
  
  dataInput <- reactive({
    if(input$heittueidenlkm<=1) 
      return(data.frame(Heittue = 1L, Palkintosumma = input$palkintopotti))
    #     if((input$heittueidenlkm*input$osallistumismaksu)>input$palkintopotti)
    #       return(paste("Palkintopotti on pienempi kuin heittueiden määrä kertaa osallistumismaksu!"))
    if(input$radio==1){
      d<-(2*input$palkintopotti-2*input$osallistumismaksu*input$heittueidenlkm)/(input$heittueidenlkm*(input$heittueidenlkm-1))
      # round to whole euros
      prizes <- floor(seq(from=input$osallistumismaksu,by=d,length=input$heittueidenlkm))
      
    } else {
      x<-uniroot(function(x) input$palkintopotti-sum(input$osallistumismaksu*x^(0:(input$heittueidenlkm-1))),
                 interval=c(0,input$heittueidenlkm))$root
      prizes<-floor(input$osallistumismaksu*x^(0:(input$heittueidenlkm-1)))
    }
    # add spares to winner
    prizes[input$heittueidenlkm] <- prizes[input$heittueidenlkm]+(input$palkintopotti-sum(prizes)) 
    data.frame(Heittue = 1:input$heittueidenlkm, Palkintosumma = as.integer(rev(prizes)))
  })
  
  output$value <- renderTable({
    input$goButton
    isolate(dataInput())
    },include.rownames=FALSE)
  
})
