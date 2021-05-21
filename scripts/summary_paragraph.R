source("scripts/dependencies.R")

get_summary_info <- function(coins) {
  ret <- list()
  # of crypto currencies
  ret$num_coins <- length(unique(coins$Name))
  ret$earliest_date <- min(coins$Date)
  ret$latest_date <- max(coins$Date)
  ret$most_expensive_coin_price <- round(max(coins$High), 2)
  ret$highest_market_cap <- round(max(coins$Marketcap), 2)
  ret
}
