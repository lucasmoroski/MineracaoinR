library(shiny)
library(pheatmap)
library(jtools)
library(broom)
library(ggstance)
d1=read.table("student-por.csv",sep=";",header=TRUE, stringsAsFactors = FALSE)
d2=read.table("student-mat.csv",sep=";",header=TRUE, stringsAsFactors = FALSE)
d4 <- subset(d1,select = c("G1","G2","G3"))



# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$plot <- renderPlot({
    #Correlação entre desempenho e variáveis quantitativas
    if(input$d == 1){
      colx <- d1[,input$x]
      coly <- d1[,input$y]
      plot(colx, coly,
           col = "blue")
    }else{
        colx <- d2[,input$x]
        coly <- d2[,input$y]
        plot(colx, coly,
             col = "#0cd8d8")
    }
  })
 
  
  output$forest <- renderPlot({
    #Regressão linear
    if(input$d == 1){
      forest <- lm(G3 ~ ., data=d1)
      plot_summs(forest, colors = "blue")
    }else{
      forest <- lm(G3 ~ ., data=d2)
      plot_summs(forest, colors = "#0cd8d8")
    }
  })
  
  output$barplot <- renderPlot({
    #Correlação entre desempenho e variáveis quantitativas
    if(input$d == 1){
      res <- lm(G3 ~ . , data=d1)
      dt <- summary(res)
      barplot(dt$coefficients[,1],las=2, col = "blue")
    }else if (input$d == 2){
      res <- lm(G3 ~ . , data=d2)
      dt <- summary(res)
      barplot(dt$coefficients[,1],las=2, col = "#0cd8d8")
    }
  })
  
}

