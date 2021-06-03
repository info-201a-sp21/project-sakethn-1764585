source("scripts/dependencies.R")
source("scripts/chart1.R")
library(dplyr)

draw_da_plot_price<-function(df, selected_coin){
  # Formatting Data with proper dates and adding user input filter
  bitcoin <- bitcoin %>% mutate(Date = get_date(Date))
  user_df <-slim_data(df)
  
  formatted_data<-reactive({dplyr::filter(user_df, Symbol %in% selected_coin)})
  # Plotting charts using bitcoin data and user filtered data 
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
    #Combining plots to make a single comparison plot with changing similar x-axis
    plots<-subplot(bitcoin_chart, other_coin_chart,
                   heights = c(0.6, 0.4),
                   nrows = 2,
                   shareX = TRUE,
                   titleY = TRUE) %>%
      layout(title = "Price Over Time vs Bitcoin")
    
    ggplotly(plots)
}

draw_da_plot_market<- function(df, selected_coin){
  # Same steps as the function before but just changing the y axis to be marketcap instead
  bitcoin <- bitcoin %>% mutate(Date = get_date(Date))
  user_df <-slim_data(df)
  
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
  
### Descriptions ###
introduction <- "On this page we will explore both the price and market cap of different cryptocurrencies
compared to that of Bitcoin. Price and Marketcap while similar tell us different things about a currency.
Price is the current value of one coin at a given moment. For example, on our graph you can see for the
month of Febuary the average price for one Bitcoin was $46,350, a hefty price for one coin. On the other hand,
market capitalization (or market cap) is the total value of all the coins that have been mined. It is calculated
by multiplying the number of coins in circulation by the current market price of a 
single coin. For example, a coin that has a price of $5 with 100,000 coins in circulation would have
a market cap of $500,000. Often coins with a higher market cap such as bitcoin are considered to be
lower risk investments than those with smaller ones as they follow a growth track-record and often
have higher liquidity - meaning they can withstand a higher volume of people cashing out without 
the price being as dramatically impacted."

question <- "We chose to compare Bitcoin as it is the largest coin on the market and has been
the frontrunner for all things cryptocurrency. Along with this during our Midpoint project an interesting
observation we had was how the marketcap trend of Bitcoin is mirrored closely by almost every other coin. 
While there are some differences, when looking from afar, the shapes that the marketcap plots are very
similar. We wanted to further explore this observation to see if trends for other cryptocurrencies were 
affected by the rise and falls of the largest one. A question like this makes sense when we begin to look
at the unfamiliarty and skeptisism that cryptocurrencies carry due to their new emergence. It would only
make sense to thing that a fall in the most trusted cryptocurrency would cause lesser known ones to follow suit."

summ <- "The reason we chose to have a scatter plot was because for this information, the clarity of a 
position based encoding helps a user see clear trends over time and clearly compare/contrast different
prices and marketcaps of the various coins. I chose to incorperate bitcoin and other currencies on seperate
graphs becuase when put together on the same graph it is difficult to visualize changes in smaller 
coins when the price and market cap of bitcoin is so large. This way we are able to see changes better on 
a y-axis that is scaled to the smaller coin."
             
summ1 <- "When looking at the information rendered out, we found that
cryptocurrencies have, overall, been on a upward trend. However, even if overall crypto has been going up,
we can clearly see two large peaks in price and marketcap within the charts. This revealed the volatility of
crypto but also when crypto was popular among investors. However, these peaks were accompanied by huge drops
of price, indicating some type of \"hype cycle\" or catastrophic event that caused the prices to plummet."
