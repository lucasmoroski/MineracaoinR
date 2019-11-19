library(shinythemes)

# Define UI for application that draws a histogram

library(shiny)
library(ggplot2)

dataset <- diamonds

ui <- fluidPage(
  
  
  titlePanel("Tabsets"),
  
  sidebarLayout(
    
    sidebarPanel(
      # Inputs excluded for brevity
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("plot")), 
        tabPanel("Summary", verbatimTextOutput("summary")), 
        tabPanel("Table", tableOutput("table"))
      )
    )
  ),
  
  hr(),
  
  fluidRow(
    column(3,
           h4("Diamonds Explorer"),
           sliderInput('sampleSize', 'Sample Size', 
                       min=1, max=nrow(dataset), value=min(1000, nrow(dataset)), 
                       step=500, round=0),
           br(),
           checkboxInput('jitter', 'Jitter')
    ),
    column(4, offset = 1,
           selectInput('x', 'X', names(dataset))
    ),
    column(4,
           selectInput('facet_row', 'Facet Row', c(None='.', names(dataset)))
    )
  ),
  hr(),
  hr()
)

