###############################################################################
# SETUP

library(dplyr)
library(plotly)
library(quantmod)

###############################################################################
# DATA

aave <- read.csv("../data/cryptocurrency-historical-prices/coin_Aave.csv",
                 stringsAsFactors = FALSE)

binance <- read.csv("../data/cryptocurrency-historical-prices/coin_BinanceCoin.csv",
                    stringsAsFactors = FALSE)

bitcoin <- read.csv("../data/cryptocurrency-historical-prices/coin_Bitcoin.csv",
                    stringsAsFactors = FALSE)

cardano <- read.csv("../data/cryptocurrency-historical-prices/coin_Cardano.csv",
                    stringsAsFactors = FALSE)

chainlink <- read.csv("../data/cryptocurrency-historical-prices/coin_ChainLink.csv",
                      stringsAsFactors = FALSE)

cosmos <- read.csv("../data/cryptocurrency-historical-prices/coin_Cosmos.csv",
                   stringsAsFactors = FALSE)

doge <- read.csv("../data/cryptocurrency-historical-prices/coin_Dogecoin.csv",
                 stringsAsFactors = FALSE)

eos <- read.csv("../data/cryptocurrency-historical-prices/coin_EOS.csv",
                stringsAsFactors = FALSE)

ethereum <- read.csv("../data/cryptocurrency-historical-prices/coin_Ethereum.csv",
                     stringsAsFactors = FALSE)

iota <- read.csv("../data/cryptocurrency-historical-prices/coin_Iota.csv",
                 stringsAsFactors = FALSE)

litecoin <- read.csv("../data/cryptocurrency-historical-prices/coin_Litecoin.csv",
                     stringsAsFactors = FALSE)

monero <- read.csv("../data/cryptocurrency-historical-prices/coin_Monero.csv",
                   stringsAsFactors = FALSE)

polkadot <- read.csv("../data/cryptocurrency-historical-prices/coin_Polkadot.csv",
                     stringsAsFactors = FALSE)

tether <- read.csv("../data/cryptocurrency-historical-prices/coin_Tether.csv",
                   stringsAsFactors = FALSE)

usdc <- read.csv("../data/cryptocurrency-historical-prices/coin_USDCoin.csv",
                 stringsAsFactors = FALSE)

xrp <- read.csv("../data/cryptocurrency-historical-prices/coin_XRP.csv",
                stringsAsFactors = FALSE)

crypto_currencies <- c("aave", "binance", "bitcoin", "cardano", "chainlink",
                       "cosmos", "doge", "eos", "ethereum", "iota", "litecoin",
                       "monero", "polkadot", "tether", "usdc", "xrp")

###############################################################################
# GRAPH

# reference https://plotly.com/r/candlestick-charts
draw_plot <- function(dframe, crypto_name) {
  # create candlestick plot (high, low, open, close)
  candle_plot <- plot_ly(data = dframe,
                         name = "Candlesticks",
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
      dframe$direction[i] = 'increasing'
    } else {
      dframe$direction[i] = 'decreasing'
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
    layout(xaxis = list(title = "Date (yr)",
                        type = "date"),
           yaxis = list(title = "Volume ($)"))
  
  # combine plots together
  subplot(candle_plot, vol_plot,
          heights = c(0.8, 0.2),
          nrows = 2,
          shareX = TRUE,
          titleY = TRUE) %>%
    layout(title = paste(crypto_name, "Candlestick Chart"),
           legend = list(orientation = "h",
                         x = 0.5,
                         y = 1,
                         xanchor = "center",
                         bgcolor = "rgba(0,0,0,0)"))
}

btc_plot <- draw_plot(bitcoin, "Bitcoin (BTC)")
eth_plot <- draw_plot(ethereum, "Ethereum (ETH)")
