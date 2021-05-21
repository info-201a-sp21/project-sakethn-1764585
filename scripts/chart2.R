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

mkt_bar_graph <- function(coins) {
  max_coin_mktcap <- coins %>%
    group_by(Name) %>%
    mutate(max_mkt_cap = round(max(Marketcap), 2)) %>%
    slice(1) %>%
    select(Symbol, max_mkt_cap)
  mkt_max <- ggplotly(ggplot(data = max_coin_mktcap) +
    geom_col(mapping = aes(x=Symbol, y=max_mkt_cap, color = Symbol,
                           fill = Symbol)) +
    xlab("Coin") +
    ylab("Max Market Cap ($)") +
    ggtitle("Max Market Cap by Coin") +
      theme(axis.text.x=element_blank()))
  
  mkt_max
}

vol_bar_graph <- function(coins) {
  max_vol_mktcap <- coins %>%
    group_by(Name) %>%
    mutate(max_vol = round(max(Volume), 2)) %>%
    slice(1) %>%
    select(Symbol, max_vol)
  vol_max <- ggplotly(ggplot(data = max_vol_mktcap) +
                        geom_col(mapping = aes(x=Symbol, y=max_vol, color = Symbol,
                                               fill = Symbol)) +
                        xlab("Coin") +
                        ylab("Volume ($ Transacted Daily)") +
                        ggtitle("Max Daily Volume by Coin") +
                        theme(axis.text.x=element_blank()))
  
  vol_max
}

max_mkt <- mkt_bar_graph(all_coins)
max_vol <- vol_bar_graph(all_coins)





