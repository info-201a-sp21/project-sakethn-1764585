# Summary Table
source("scripts/dependencies.R")

# Creating a Subset of Data that only includes information from 2020
dates_last_year <- function(data) {
  data %>%
  select(SNo, Name, Symbol, Date, High, Low,
         Open, Close, Volume, Marketcap) %>%
  filter(between(Date, as.Date("2020-01-01"),
                 as.Date("2020-12-31")))
}

summary_table <- function(data) {
  dates_last_year(data) %>%
  group_by(Name) %>%
  mutate(avg_price_change = round(mean(Close - Open), 5),
         max_price = round(max(High), 2),
         min_price = round(min(Low), 2),
         marketcap_change = round((Marketcap) - lead(Marketcap), 2),
         volume_change = round(mean(Volume), 2)) %>%
  slice(1) %>%
  select(Name, avg_price_change, max_price,
         min_price, marketcap_change, volume_change)
}

get_summary_kable <- function(data) {
  kable(
    summary_table(data),
    col.names = c("Name", "Average Change in Daily Price ($)",
                  "Highest Price ($)", "Lowest Price ($)",
                  "Change in Market Cap ($)",
                  "Average Volume (Daily Transacted Amount in $)"),
    caption = "Cryptocurrency in 2020", "simple")
}
