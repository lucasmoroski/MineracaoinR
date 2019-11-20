library(shinythemes)

# Define UI for application that draws a histogram

library(shiny)
library(ggplot2)
library(forestmodel)

setwd("~/TADS 2019_2/Tópicos em BD/student")

d1=read.table("student-mat.csv",sep=";",header=TRUE, stringsAsFactors = FALSE)
d2=read.table("student-por.csv",sep=";",header=TRUE, stringsAsFactors = FALSE)

d3=merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))

d4 <- subset(d1,select = c("G1","G2","G3"))

res<- lm(G3 ~ .,data=d2)

dataset <- d3
datasetg <- d4

ui <- fluidPage(
  
  
  titlePanel("Tabsets"),
  
  sidebarLayout(
    
    sidebarPanel(
      # Inputs excluded for brevity
      selectInput('x', 'X', names(dataset)),
      selectInput('y', 'Y', c(None='.', names(datasetg)))
      
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput(forest_model(res))), 
        tabPanel("Summary", verbatimTextOutput("summary")), 
        tabPanel("Table", tableOutput("table"))
      )
    )
  ),
  
  hr(),
  hr()
)

