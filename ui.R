shinyUI(bootstrapPage(
    selectInput(inputId = "graphs",
                label = "graph type:",
                choices = c("histogram", "monthly data"),
                selected = "histogram"),
    
    checkboxInput(inputId = "density",
                  label = strong("density or histogram?"),
                  value = FALSE),
        
    checkboxInput(inputId = "C_F",
                  label = strong("switch temperature F <-> C"),
                  value = FALSE),
    
    plotOutput(outputId = "main_plot", height = "300px"),
    
    conditionalPanel(condition = "input.density == true",
                     sliderInput(inputId = "bw_adjust",
                                 label = "Binsize adjustment:",
                                 min = 1, max = 5, value = 2, step = 0.5)
    )
))