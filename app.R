# TODO:
# Center images
# Match font
# 
# 
#
#    
#

library(shiny)
library(dplyr)

d <- read.csv("data/gradeTable.csv",header = FALSE)
colnames(d) <- c("Grade","Percent")

ui <- fluidPage(
  img(src = "SC Centercourt final CMYK.jpg", height = 72, width = 72),
  h1("Shorecrest Honnors IPS Grade Calculation"),
  p("Please use the fields below to calculate your Honors IPS grade.  Enter both  your current IPS and IPS Challenge grades as they appear in Canvas.  You need to enter the percent- not the letter grade.  All final grades will be rounded to the nearest whole number."),
  numericInput("Number1", "IPS grade :", 75, min = 1, max = 100),
  numericInput("Number2", "IPS Challenge grade :", 75, min = 1, max = 100),
  h4("Honors IPS grade:"),
  verbatimTextOutput("value"),
  tableOutput('table')
)

server <- function(input, output) {

  output$value <- renderText({ 
      
        round(
          (input$Number1 *.75) + (input$Number2 *.25) 
        )
      
    })
  output$table <- renderTable(d)
}


# Run the application 
shinyApp(ui = ui, server = server)

