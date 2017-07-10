library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)
library(MASS)
library(tibble)
library(NonCompart)
library(ncar)
library(markdown)

source("function.R")


# Define server logic required for pk1c ----

shinyServer(function(input, output) {
  
  # concTable ----
  
  output$concTable <- renderTable({
    Vars <- Init(input$nSubj, input$CL, input$V, input$DH1, input$FullCov, input$Time,              input$PropE, input$AddE, input$Jitter)
    return(Vars$Conc)
  })
 
  # concTimePlot ----
  
  output$concTimePlot <- renderPlot({
    Vars <- Init(input$nSubj, input$CL, input$V, input$DH1, input$FullCov, input$Time,              input$PropE, input$AddE, input$Jitter)
    p <- ggplot(Vars$Conc, aes(x=TIME, y=CONC, group=SUBJ, color=SUBJ)) + 
      geom_line() +
      geom_point(size = 3)
    
    if (input$concLog == FALSE) print(p) else print(p + scale_y_log10())
  })
  
  output$concTimeFacet <- renderPlot({
    Vars <- Init(input$nSubj, input$CL, input$V, input$DH1, input$FullCov, input$Time,              input$PropE, input$AddE, input$Jitter)
    p <- ggplot(Vars$Conc, aes(x=TIME, y=CONC, group=SUBJ, color=SUBJ)) + 
      geom_line() +
      geom_point(size = 3) +
      facet_wrap(~ SUBJ, ncol = 4)
    
    if (input$concLog == FALSE) print(p) else print(p + scale_y_log10())
  })
  
  output$ncarTable <- renderTable({
    Vars <- Init(input$nSubj, input$CL, input$V, input$DH1, input$FullCov, input$Time,              input$PropE, input$AddE, input$Jitter)
    resNCA = NonCompart::tabNCA(Vars$Conc, colSubj="SUBJ", colTime="TIME", colConc="CONC", dose=sum(Vars$DH1[,2]), adm="Bolus")
    return(resNCA)
  })
})
