library(shinythemes)

# Define UI for application that draws a histogram

library(shiny)
library(ggplot2)
library(forestmodel) 

pageWithSidebar(
  headerPanel('Student'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', choices = c('G1', 'G2', 'G3')),
    selectInput('ycol', 'Y Variable', names(iris),
                selected=names(iris)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9)
  ),
  mainPanel(
    plotOutput('plot1')
  )
)

