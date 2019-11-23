library(shinythemes)

# Define UI for application that draws a histogram

library(shiny)

d1=read.table("student-mat.csv",sep=";",header=TRUE, stringsAsFactors = FALSE)

grades <- subset(d1,select = c("G1","G2","G3"))
factors <- subset(d1, select = c("absences","age","failures","famrel","Fedu","Medu"))


ui <- fluidPage(
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")#tema lux
  ),
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "layout.css")#all css
  ),
  
  titlePanel("Estudantes  X  Fatores Quantitativos"),
  
  sidebarLayout(
    
    sidebarPanel(
      # Inputs excluded for brevity
      selectInput('d', 'Disciplina',choices = list("Português" = 1, "Matemática" = 2)),
      selectInput('x', 'Média Anual (Eixo X)', names(grades)),
      selectInput('y', 'Fator (Eixo Y)', names(factors))
      
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("plot"), helpText("Este gráfico varia dentro dos 3 parâmetros ao lado.")),
        tabPanel("ForestPlot", plotOutput("forest"), helpText("Este gráfico varia somente dentro do parâmetro 'Disciplina'.")),
        tabPanel("BarPlot", plotOutput("barplot"), helpText("Este gráfico varia somente dentro do parâmetro 'Disciplina'."))
      )
    )
  ),
  
  hr()
)

