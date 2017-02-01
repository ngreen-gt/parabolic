
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source("parabolic.R")


shinyServer(function(input, output) {

  output$newtonPlot <- renderPlot({

    # generate trajectory based on input from ui.R and parobolic function
    newton<-parabolic(input$vo,input$alpha)
    
    # draw the plot
    plot(newton$p, newton$y, xlab="X", ylab="Y", type = "o", col = "red", axes=F)
    axis(1, at = seq(0,newton$L,newton$L/10),labels=seq(0,newton$L,newton$L/10),
         cex.axis=0.7)
    axis(2, at = seq(0,newton$H,newton$H/100),labels=seq(0,newton$H,newton$H/100),
         cex.axis=0.7)
    legend(newton$L/4, newton$H/3, legend = c(paste("vo =", newton$vo, "ft/s"),
                                paste("alpha =", newton$alpha,"degrees"),
                                paste("Time of ascent", paste(newton$T_1,"s")),
                                paste("Height, maximum", paste(newton$H,"ft")),
                                paste("Time of descent", paste(newton$T_2, "s")),
                                paste("Time, total", paste(newton$T_t,"s")),
                                paste("Horizontal Range, maximum", paste(newton$L,"ft"))),
           cex=0.7, bg = par("bg"))
    title(main = "Parabolic Shot", sub = "From Origin & Frictionless")

  })

})
