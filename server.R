# Server Functions

# Load Data 
source("scripts/dependencies.R")

# Load Library
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$page_two_chart <- renderPlotly({
        volume_data <- data_by_year %>% 
            filter(Date == input$year_input) %>% 
            group_by(Name) %>% 
            mutate(Volume = ave(Volume))
        
        volume_by_year <- volume_data %>% 
            select(Name, Volume) %>% 
            distinct()
        

        plot_page_two <- ggplot(data = volume_by_year,
                                mapping = aes(x = volume_by_year$Name,
                                              y = volume_by_year$Volume)) +
            geom_bar(stat = "identity") +
            theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
            labs(title = paste0("Volume during ",input$year_input),
                 x = "Names", y = "Volume") +
            theme(plot.title = element_text(hjust = 0.5))
        

        # generate bins based on input$bins from ui.R
       # x    <- faithful[, 2]
       # bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
       # hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

})
