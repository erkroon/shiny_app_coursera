shinyServer(function(input, output) {
library(ggplot2)
library(shiny)

    output$main_plot <- renderPlot({
    if (input$graphs == "histogram"){
            if (input$C_F) {
                    airquality$Temp <- ((airquality$Temp -32) * (5/9))
                    lab <- c("Temperature [C]")
            } else {  
                    airquality$Temp <- (airquality$Temp)
                    lab <- c("Temperature [F]")
            }
            
            if (input$density) {
                p <- ggplot(airquality, aes(Temp, ..density..))
            } else {
                p <- ggplot(airquality, aes(Temp))
            }
             
            p <- p + geom_histogram(binwidth = input$bw_adjust)
            p <- p + geom_density(alpha=.2, fill="#FF6666")
            p <- p + labs(title = "Monthly temperature in New York")
            p <- p + xlab(lab)
            print(p)
        }       
       else
       {
           if (input$C_F) {
                airquality$Temp <- ((airquality$Temp -32) * (5/9))
                lab <- c("Temperature [C]")
            } else {  
                airquality$Temp <- (airquality$Temp)
                lab <- c("Temperature [F]")
            }
           
           p <- ggplot(airquality, aes(Month, Temp)) + geom_point()
           p <- p + facet_grid( . ~ Month)
           p <- p + labs(title = "Monthly temperature in New York")
           p <- p + xlab(lab)
           print(p)
       }
      
        if (input$density) {
            dens <- density(airquality$Temp,
                            adjust = input$bw_adjust)
            lines(dens, col = "blue")
        }       
    })

})