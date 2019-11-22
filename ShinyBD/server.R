library(pheatmap)

function(input, output, session) {
  
  d1=read.table("student/student-mat.csv",sep=";",header=TRUE)
  d2=read.table("student/student-por.csv",sep=";",header=TRUE)
  d3=merge(d1,d2,by=c("school","sex","age","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
  
  # Combine the selected variables into a new data frame
output$plot1 <- renderPlot({
  ind <- NULL
  for (i in 1:ncol(d3)) {
    ind <- c(ind, is.numeric(d3[,i]))
  }
  num_d3 <- d3[,ind]
  num_d3 <- as.matrix(num_d3)
  cor_d3 <- cor(num_d3)
  pheatmap(cor_d3)
  })
  
}
