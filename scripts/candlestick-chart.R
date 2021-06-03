source("scripts/dependencies.R")

# Draws a candlestick plot for a given cryptocurrency
# reference https://plotly.com/r/candlestick-charts
draw_plot <- function(dframe, crypto_name, start_year = 2015, end_year = 2021) {
  # extract year from all dates in dframe
  dframe <- dframe %>%
    mutate(year = format(as.Date(pull(., Date)), "%Y")) %>%
    filter(year >= as.numeric(start_year), year <= as.numeric(end_year))


  # create candlestick plot (high, low, open, close)
  candle_plot <- plot_ly(data = dframe,
                         name = "Price Direction",
                         x = ~Date,
                         type = "candlestick",
                         open = ~Open,
                         close = ~Close,
                         high = ~High,
                         low = ~Low) %>%
    layout(xaxis = list(title = "Date",
                        type = "date",
                        rangeslider = list(visible = FALSE)),
           yaxis = list(title = "Price ($)"))

  # find direction for each day ('increasing' if close >= open)
  for (i in 1:length(dframe[, 1])) {
    if (dframe$Close[i] >= dframe$Open[i]) {
      dframe$direction[i] <- "increasing"
    } else {
      dframe$direction[i] <- "decreasing"
    }
  }

  # create volume bar chart
  vol_plot <- plot_ly(data = dframe,
                      name = "Volume",
                      x = ~Date,
                      y = ~Volume,
                      type = "bar",
                      color = ~direction,
                      colors = c("green", "red")) %>%
    layout(xaxis = list(title = "Date (year)",
                        type = "date"),
           yaxis = list(title = "Volume ($)"))

  # combine plots together
  subplot(candle_plot, vol_plot,
          heights = c(0.8, 0.2),
          nrows = 2,
          shareX = TRUE,
          titleY = TRUE) %>%
    layout(title = paste(crypto_name, "Candlestick Chart"),
           margin = list(l = 60, r = 20, t = 60, b = 70),
           legend = list(orientation = "h",
                         x = 0.5,
                         y = 1,
                         xanchor = "center",
                         bgcolor = "rgba(0,0,0,0)"))
}

btc_plot <- draw_plot(bitcoin, "Bitcoin (BTC)")
eth_plot <- draw_plot(ethereum, "Ethereum (ETH)")
