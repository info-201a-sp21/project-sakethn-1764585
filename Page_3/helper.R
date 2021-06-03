##### helper.R Description #####
#

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

  h3("What do these charts tell us about volatility?"),
  hr(),
  p(obs),
  br(),

  h3("What can we learn from this?"),
  hr(),
  p(analysis)
)

##### Introduction #####
intro <- paste(
  "Candlestick charts are very useful to investors, as they can be used to see market prices over time, how much trading activity is going on, and countless patterns that can inform their decisions to buy, sell, or hold onto their coins. ",
  br(), "", br(),
  "The question we want to look into is, how does the volatility compare between Bitcoin and Ethereum between 2013 and 2021?")

##### Observations #####
obs <- paste("Sentence 1.", "Sentence 2.")

##### Analysis #####
analysis <- paste("Sentence 1.", "Sentence 2.")
