library(dplyr)
library(plotly)
library(ggplot2)

aave <- read.csv("./data/cryptocurrency-historical-prices/coin_Aave.csv",
                 stringsAsFactors = FALSE)
binance <- read.csv("./data/cryptocurrency-historical-prices/coin_BinanceCoin.csv",
                    stringsAsFactors = FALSE)
bitcoin <- read.csv("./data/cryptocurrency-historical-prices/coin_Bitcoin.csv",
                    stringsAsFactors = FALSE)
cardano <- read.csv("./data/cryptocurrency-historical-prices/coin_Cardano.csv",
                    stringsAsFactors = FALSE)
chainlink <- read.csv("./data/cryptocurrency-historical-prices/coin_ChainLink.csv",
                      stringsAsFactors = FALSE)
cosmos <- read.csv("./data/cryptocurrency-historical-prices/coin_Cosmos.csv",
                   stringsAsFactors = FALSE)
doge <- read.csv("./data/cryptocurrency-historical-prices/coin_Dogecoin.csv",
                 stringsAsFactors = FALSE)
eos <- read.csv("./data/cryptocurrency-historical-prices/coin_EOS.csv",
                stringsAsFactors = FALSE)
ethereum <- read.csv("./data/cryptocurrency-historical-prices/coin_Ethereum.csv",
                     stringsAsFactors = FALSE)
iota <- read.csv("./data/cryptocurrency-historical-prices/coin_Iota.csv",
                 stringsAsFactors = FALSE)
litecoin <- read.csv("./data/cryptocurrency-historical-prices/coin_Litecoin.csv",
                     stringsAsFactors = FALSE)
monero <- read.csv("./data/cryptocurrency-historical-prices/coin_Monero.csv",
                   stringsAsFactors = FALSE)
polkadot <- read.csv("./data/cryptocurrency-historical-prices/coin_Polkadot.csv",
                     stringsAsFactors = FALSE)
tether <- read.csv("./data/cryptocurrency-historical-prices/coin_Tether.csv",
                   stringsAsFactors = FALSE)
usdc <- read.csv("./data/cryptocurrency-historical-prices/coin_USDCoin.csv",
                 stringsAsFactors = FALSE)
xrp <- read.csv("./data/cryptocurrency-historical-prices/coin_XRP.csv",
                stringsAsFactors = FALSE)

all_coins <- rbind(aave, binance, bitcoin, cardano, chainlink, cosmos, doge,
                   eos, ethereum, iota, litecoin, monero, polkadot, tether,
                   usdc, xrp)

get_date <- function(date) {
    as.Date(substr(date, 1, 10), format = "%Y-%m-%d")
}

all_coins <- all_coins %>% mutate(Date = get_date(Date))

price_over_time <- ggplotly(ggplot(data = all_coins) +
  geom_point(mapping = aes(x = Date, y = Close, color = Symbol)) +
  ggtitle("Price over Time") +
  xlab("Time") +
  ylab("Price") +
  scale_x_date(date_labels = "%b-%Y"))

marketcap_over_time <- ggplotly(ggplot(data = all_coins) +
  geom_point(mapping = aes(x = Date, y = Marketcap, color = Symbol)) +
  ggtitle("Market Cap over Time") +
  xlab("Time") +
  ylab("Market Cap") +
  scale_x_date(date_labels = "%b-%d-%Y"))
