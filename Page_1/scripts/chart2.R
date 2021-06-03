source("scripts/dependencies.R")

mkt_bar_graph <- function(coins) {
  max_coin_mktcap <- coins %>%
    group_by(Name) %>%
    mutate(max_mkt_cap = round(max(Marketcap), 2)) %>%
    slice(1) %>%
    select(Symbol, max_mkt_cap)
  mkt_max <- ggplotly(ggplot(data = max_coin_mktcap) +
    geom_col(mapping = aes(x = Symbol, y = max_mkt_cap, color = Symbol,
                           fill = Symbol)) +
    xlab("Coin") +
    ylab("Max Market Cap ($)") +
    ggtitle("Max Market Cap by Coin") +
      theme(axis.text.x = element_blank()))

  mkt_max
}

vol_bar_graph <- function(coins) {
  max_vol_mktcap <- coins %>%
    group_by(Name) %>%
    mutate(max_vol = round(max(Volume), 2)) %>%
    slice(1) %>%
    select(Symbol, max_vol)
  vol_max <- ggplotly(ggplot(data = max_vol_mktcap) +
                        geom_col(mapping = aes(x = Symbol, y = max_vol,
                                               color = Symbol, fill = Symbol)) +
                        xlab("Coin") +
                        ylab("Volume ($ Transacted Daily)") +
                        ggtitle("Max Daily Volume by Coin") +
                        theme(axis.text.x = element_blank()))
  vol_max
}
