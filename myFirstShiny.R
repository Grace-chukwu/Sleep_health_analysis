library(shiny)
library(shinydashboard)


ui <- dashboardPage(
      dashboardHeader(title = "My Dashboard"),
      dashboardSidebar(),
      dashboardBody(
        fluidPage (
          titlePanel("Sleep Health Visuals"),
          
          fluidRow(
            column(10, plotOutput("chart1")),
            column(10, plotOutput("chart2")),
            column(10, plotOutput("chart3"))
          )
        )
        
      )
  
  
)



server <- function(input,output){
  output$chart1 <- renderPlot({
   
     # Convert frequency table to long format
    Occupation_frequency_long <- gather(Occupation_frequency_table, key = 
                          "Variable", value = "Value", -Gender, -Occupation)
    
      # Create a stacked column chart using ggplot2
      ggplot(Occupation_frequency_long,
             aes(x = Occupation, y = Value,fill = Gender)) +
        geom_bar(stat = "identity") +
        labs(title = "A Chart Showing Relationship Between occupation and Gender", x = "Occupation", y = "Count") +
        theme_minimal() +
        scale_fill_brewer(palette = 9)
  })



# second visual
  output$chart2 <- renderPlot({
  # Convert to a data frame for plotting
  average_steps_df <- data.frame(Gender = names(average_steps), AverageSteps = average_steps)
  
  # Create a bar plot
  barplot(average_steps_df$AverageSteps, names.arg = average_steps_df$Gender, 
          main = "Average Daily Steps by Gender", xlab = "Gender", ylab = "Average Steps")

})

  
  # Third Visual
  
}

    
    
    

  
shinyApp(ui, server)








