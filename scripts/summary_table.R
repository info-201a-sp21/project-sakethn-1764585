# Summary Table 

library(dplyr)
library(stringr)

aave <- read.csv(file = "data/cryptocurrency-historical-prices/coin_Aave.csv",
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

# Creating a Subset of Data that only includes information from 2020
dates_last_year <- all_coins %>% 
  select(SNo, Name, Symbol, Date, High, Low, Open, Close, Volume, Marketcap) %>% 
  filter(between(Date, as.Date("2020-01-01"),
                 as.Date("2020-12-31")))

summary_table <- dates_last_year %>%
  group_by(Name) %>% 
  mutate(avg_price_change = round(mean(Close - Open), 5),
         max_price = round(max(High), 2),
         min_price = round(min(Low), 2),
         marketcap_change = round(lead(Marketcap) - (Marketcap), 2),
         volume_change = round(lead(Volume) - (Volume), 2)) %>%
  slice(1) %>% 
  select(Name, avg_price_change, max_price, min_price, marketcap_change, volume_change)
