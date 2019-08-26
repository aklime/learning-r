library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("My first shiny App"),
    
    sidebarPanel(
      selectInput("Distribution", "Please Select Distribution Type",
                  choices = c("Normal", "Exponential")),
      sliderInput("sampleSize", "Please Select Sample Size: ",
                  min=100, max=5000, value=1000, step=100),
      conditionalPanel(condition = "input.Distribution == 'Normal'",
                       textInput("mean", "Please Select the mean", 0),
                       textInput("sd","Please select Standard Deviation", 3)),
      conditionalPanel(condition = "input.Distribution == 'Exponential'",
                       textInput("lambda", "Please Select Exponential Lambda", 1)) 
    ),
    
    mainPanel(
      plotOutput("myPlot")
    )
    
  )
)