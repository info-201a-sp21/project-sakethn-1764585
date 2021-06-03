# Get dependencies
source("scripts/dependencies.R")

# Give a chart about cryptocurrency price over time (Data is slimmed down)
price_over_time <- function(data) {
  ggplotly(ggplot(data = slim_data(data)) +
  geom_point(mapping = aes(x = Date, y = Close, color = Symbol)) +
  ggtitle("Price over Time") +
  xlab("Time") +
  ylab("Price ($)") +
  scale_x_date(date_labels = "%b-%Y"))
}

# Give a chart about cryptocurrency marketcap over time (Data is slimmed down)
marketcap_over_time <- function(data) {
  ggplotly(ggplot(data = slim_data(data)) +
  geom_point(mapping = aes(x = Date, y = Marketcap, color = Symbol)) +
  ggtitle("Market Cap over Time") +
  xlab("Time") +
  ylab("Market Cap ($)") +
  scale_x_date(date_labels = "%b-%d-%Y"))
}
