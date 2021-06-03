library(dplyr)
library(knitr)
library(plotly)
library(ggplot2)
library(stringr)
library(quantmod)
library(kableExtra)

knitr::opts_chunk$set(echo = TRUE)

data_path <- "data/cryptocurrency-historical-prices/coin_"
aave <- read.csv(paste0(data_path, "Aave.csv"), stringsAsFactors = FALSE)
binance <- read.csv(paste0(data_path, "BinanceCoin.csv"),
                    stringsAsFactors = FALSE)
bitcoin <- read.csv(paste0(data_path, "Bitcoin.csv"), stringsAsFactors = FALSE)
cardano <- read.csv(paste0(data_path, "Cardano.csv"), stringsAsFactors = FALSE)
chainlink <- read.csv(paste0(data_path, "ChainLink.csv"),
                      stringsAsFactors = FALSE)
cosmos <- read.csv(paste0(data_path, "Cosmos.csv"), stringsAsFactors = FALSE)
doge <- read.csv(paste0(data_path, "Dogecoin.csv"), stringsAsFactors = FALSE)
eos <- read.csv(paste0(data_path, "EOS.csv"), stringsAsFactors = FALSE)
ethereum <- read.csv(paste0(data_path, "Ethereum.csv"),
                     stringsAsFactors = FALSE)
iota <- read.csv(paste0(data_path, "Iota.csv"), stringsAsFactors = FALSE)
litecoin <- read.csv(paste0(data_path, "Litecoin.csv"),
                     stringsAsFactors = FALSE)
monero <- read.csv(paste0(data_path, "Monero.csv"), stringsAsFactors = FALSE)
polkadot <- read.csv(paste0(data_path, "Polkadot.csv"),
                     stringsAsFactors = FALSE)
tether <- read.csv(paste0(data_path, "Tether.csv"), stringsAsFactors = FALSE)
usdc <- read.csv(paste0(data_path, "USDCoin.csv"), stringsAsFactors = FALSE)
xrp <- read.csv(paste0(data_path, "XRP.csv"), stringsAsFactors = FALSE)
all_coins <- rbind(aave, binance, bitcoin, cardano, chainlink, cosmos, doge,
                   eos, ethereum, iota, litecoin, monero, polkadot, tether,
                   usdc, xrp)

get_date <- function(date) {
    as.Date(substr(date, 1, 10), format = "%Y-%m-%d")
}
all_coins <- all_coins %>% mutate(Date = get_date(Date))
slim_data <- function(data) {
  data %>%
    mutate(Date = format(Date, "%Y-%m")) %>%
    group_by(Date, Symbol) %>%
    summarise(Close = mean(Close), Marketcap = mean(Marketcap)) %>%
    mutate(Date = as.Date(paste0(Date, "-01"), format = "%Y-%m-%d"))
}


