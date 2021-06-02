# Server Functions

# Load Data
source("scripts/dependencies.R")
source("ui.R")

# Load Library
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    ##### PAGE TWO CHART #####
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
                 x = "Names of Cryptocurrencies", y = "Volume Over the Year") +
            theme(plot.title = element_text(hjust = 0.5))


        # generate bins based on input$bins from ui.R
        # x    <- faithful[, 2]
        # bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        # hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })

    ##### PAGE THREE CHART #####
    source("Page_3/candlestick.R")

    output$plot_3_btc <- renderPlotly({
        time_frame <- input$year_range
        start_year <- time_frame[1]
        end_year <- time_frame[2]
        draw_plot(bitcoin, "Bitcoin", start_year, end_year)
    })

    output$plot_3_eth <- renderPlotly({
        time_frame <- input$year_range
        start_year <- time_frame[1]
        end_year <- time_frame[2]
        draw_plot(ethereum, "Ethereum", start_year, end_year)
    })
})
