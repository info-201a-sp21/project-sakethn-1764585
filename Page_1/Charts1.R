source("scripts/dependencies.R")
source("scripts/chart1.R")

draw_da_plot_price<-function(df, selected_coin){
  
  bitcoin <- bitcoin %>% mutate(Date = get_date(Date))
  user_df<- df%>% mutate(Date = get_date(Date))
  user_df <-slim_data(user_df)
  
  formatted_data<-reactive({dplyr::filter(user_df, Symbol %in% selected_coin)})
  
    other_coin_chart<-ggplotly(ggplot(data = formatted_data()) +
                                 geom_point(mapping = aes(x = Date, y = Close, fill = Symbol)) +
                                 ggtitle("Price over Time") +
                                 xlab("Time") +
                                 ylab("Price ($)") +
                                 scale_x_date(date_labels = "%b-%Y"))
    bitcoin_chart<-ggplotly(ggplot(data = slim_data(bitcoin)) +
                              geom_point(mapping = aes(x = Date, y = Close, color = Symbol)) +
                              ggtitle("Price over Time") +
                              xlab("Time") +
                              ylab("Price ($)") +
                              scale_x_date(date_labels = "%b-%Y"))
    plots<-subplot(bitcoin_chart, other_coin_chart,
                   heights = c(0.6, 0.4),
                   nrows = 2,
                   shareX = TRUE,
                   titleY = TRUE) %>%
      layout(title = "Price Over Time vs Bitcoin")
    
    ggplotly(plots)
}

draw_da_plot_market<- function(df, selected_coin){
  bitcoin <- bitcoin %>% mutate(Date = get_date(Date))
  user_df<- df%>% mutate(Date = get_date(Date))
  user_df <-slim_data(user_df)
  
  formatted_data<-reactive({dplyr::filter(user_df, Symbol %in% selected_coin)})
  
    other_coin_chart_market<-ggplotly(ggplot(data = formatted_data()) +
                                        geom_point(mapping = aes(x = Date, y = Marketcap, fill = Symbol)) +
                                        ggtitle("Market Cap over Time") +
                                        xlab("Time") +
                                        ylab("Market Cap ($)") +
                                        scale_x_date(date_labels = "%b-%Y"))
    bitcoin_chart_market<-ggplotly(ggplot(data = slim_data(bitcoin)) +
                                     geom_point(mapping = aes(x = Date, y = Marketcap, color = Symbol)) +
                                     ggtitle("Market Cap over Time") +
                                     xlab("Time") +
                                     ylab("Market Cap ($)") +
                                     scale_x_date(date_labels = "%b-%Y"))
    plots2<-subplot(bitcoin_chart_market, other_coin_chart_market,
                    heights = c(0.6, 0.4),
                    nrows = 2,
                    shareX = TRUE,
                    titleY = TRUE) %>%
      layout(title = "Marketcap Over Time vs Bitcoin")
    
    ggplotly(plots2)
}
  
