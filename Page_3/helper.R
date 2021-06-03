##### helper.R Description #####
#

##### Introduction #####
intro <- paste(
  "Candlestick charts are quite useful, as they can show you how the price of an asset is changing over time, how trading activity has been shifting in that timeframe, and even help you predict where the price of an asset is going next. Basically, they're a great way to identify patterns in the market, and can help inform your trading decisions.",
  br(), "", br(),
  "Volatility, then, is essentially a measure of risk in an asset, or how quickly its price will move up or down in a short period of time. For example, an asset with high volatility is bound to fluctuate quickly and dramatically in either direction, while an asset with low volatility may still continue to change over time, but at a steady pace.",
  br(), "", br(),
  "With the mini crash course out of the way, we can turn our attention to the candlestick charts on the left and ask ourselves, how does the volatility of Bitcoin and Ethereum compare over time between 2015 and 2021?")

##### Observations #####
obs <- paste(
  "Let's begin with a general discussion of how the market has changed over time for both cryptocurrencies. At first glance, both Bitcoin and Ethereum have very similar trends, with the major differences being the scale in price and volume. Among the clearest similarities are the first major peak in 2018, and the more recent spike at the end of 2020.",
  br(), "", br(),
  "Comparing the 2018 peaks or \"bubbles,\" it appears Bitcoin and Ethereum saw roughly the same percent increase in price over the 5 months leading up to the peak. However, Bitcoin's volume saw a near twofold greater increase in volume compared to Ethereum, implying that its demand and popularity were substantially higher at the time.",
  br(), "", br(),
  "After their inevitable nose-dives back down to reality, both crypto markets would go into hibernation for a few years as they waited for the next big opportunity. And boy, did they get what they wanted. As 2020 peeked around the corner, so too did the cryptos \"peek\" in price, with Bitcoin skyrocketing from $10,000 per coin to nearly $60,000, and Ethereum going from $250 to just over $2000. However, as they say, all that goes up must come crashing down, and the rest is history in the making.",
  br(), "", br(),
  "While these charts alone cannot tell us the real-world context behind these peaks, persistent uptrends are often the result of more businesses accepting certain cryptos, public hype by popular influencers, and other such benefactors. Other forces, such as government regulation, competition from alternative coins, and an unsuspected global pandemic, can certainly cause the price of a cryptocurrency to go down.",
  br(), "", br(),
  "If you're interested, we'll talk about the implications of these observations on the volatility of both cryptocurrencies in the summary page.")

##### Page Layout #####
side <- sidebarPanel(
  width = 6,

  # remove sub-ticks in slider
  tags$style(
    type = "text/css",
    ".irs-grid-pol.small {height: 0px;}"
  ),

  # slider
  sliderInput(
    inputId = "year_range",
    label = "Select Time Frame",
    min = 2015, max = 2021,
    value = c(2015, 2021),
    sep = ""
  ),

  # Graphs
  br(),
  plotlyOutput("plot_3_btc"),
  br(),
  plotlyOutput("plot_3_eth")
)

main <- mainPanel(
  width = 6,

  h3("Introduction to candlestick charts and volatility"),
  hr(),
  p(HTML(intro)),
  br(),

  h3("What can we gather from these charts?"),
  hr(),
  p(HTML(obs))
)
