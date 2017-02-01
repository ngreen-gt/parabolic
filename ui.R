
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("First Shooter Trajectory"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("alpha",
                  "Angle (degrees):",
                  min = 0,
                  max = 90,
                  value = 45),
      sliderInput("vo",
                  "Velocity (ft/s):",
                  min = 0,
                  max = 50,
                  value = 20)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("newtonPlot")
    )
  )
))
