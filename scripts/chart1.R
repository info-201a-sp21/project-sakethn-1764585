source("scripts/dependencies.R")

price_over_time <- function(data) {
  ggplotly(ggplot(data = data) +
  geom_point(mapping = aes(x = Date, y = Close, color = Symbol)) +
  ggtitle("Price over Time") +
  xlab("Time") +
  ylab("Price ($)") +
  scale_x_date(date_labels = "%b-%Y"))
}

marketcap_over_time <- function(data) {
  ggplotly(ggplot(data = data) +
  geom_point(mapping = aes(x = Date, y = Marketcap, color = Symbol)) +
  ggtitle("Market Cap over Time") +
  xlab("Time") +
  ylab("Market Cap ($)") +
  scale_x_date(date_labels = "%b-%d-%Y"))
}
