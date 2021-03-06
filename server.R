# Get Dependencies
source("scripts/dependencies.R")

# Define server logic required to draw a different graphs/diagrams
server <- shinyServer(function(input, output) {
    #### PAGE ONE GRAPHS####
    source("scripts/page1.R")

    output$page_one_chart_price <- renderPlotly({
        selected_coin <- input$checkboxInput
        draw_da_plot_price(all_coins, selected_coin)
        })

    output$page_one_chart_market <- renderPlotly({
        selected_coin <- input$checkboxInput
        draw_da_plot_market(all_coins, selected_coin)
        })


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
            labs(title = paste0("Volume during ", input$year_input),
                 x = "Names of Cryptocurrencies", y = "Volume Over the Year") +
            theme(plot.title = element_text(hjust = 0.5))
    })

    ##### PAGE THREE CHART #####
    source("scripts/candlestick-chart.R")

    draw_plot_reactive <- function(input_range, dframe, crypto_name) {
        start_year <- input_range[1]
        end_year <- input_range[2]
        p <- draw_plot(dframe, crypto_name, start_year, end_year)
    }

    output$plot_3_btc <- renderPlotly({
        pr <- draw_plot_reactive(input$year_range, bitcoin, "Bitcoin")
    })

    output$plot_3_eth <- renderPlotly({
        pr <- draw_plot_reactive(input$year_range, ethereum, "Ethereum")
    })
})
