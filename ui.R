# Get all dependencies
source("scripts/dependencies.R")

##### Home Page #####
introduction_page <- fluidPage(
  includeCSS("www/app.css"),
  tags$div(tags$div(
    h1("Cryptocurrencies: A Data Driven Analysis")
      %>% tagAppendAttributes(class = "glow"),
    p(em("Overview: "), "Cryptocurrencies are a form of currency where the value
      comes not from a trust in any government/centralized authority, but
      rather from a trust in cryptography and the mathematical properties
      of a data structure known as the blockchain.") %>%
      tagAppendAttributes(style = "width: 500px;"),
  ) %>%
    tagAppendAttributes(class = "titleStyle")) %>%
    tagAppendAttributes(class = "bgStyle")


)

##### About Page #####
about_content <- fluidPage(
  includeCSS("www/app.css"),
  h2("Questions:"),
  p("Here are some of the questions we would like to answer regarding
      these technologies"),
  tags$li("Which cryptocurrency is the most important in day to day use?"),
  tags$li("What areas of the world are most involved in the cryptocurrency
    mining process? How much electricity have they used overtime and how has
    that impacted certain geological areas?"),
  tags$li("How does price and price growth
         impact other parts of a cryptocurrency like mining and geological node
         locations?"),
  h2("Datasets:"),
  tags$a("Cryptocurrency Historical Datasets",
         href =
           "https://www.kaggle.com/sudalairajkumar/cryptocurrencypricehistory"),
  tags$br(),
  tags$a("Ethereum Blockchain Data",
         href =
           "https://www.kaggle.com/kingburrito666/ethereum-historical-data")
)

about_page <- tabPanel(
  "About",
  about_content
) %>% tagAppendAttributes(class = "thin-center")

home_page <- tabPanel(
  "Home Page",
  introduction_page
)

##### Interactive Page One #####
source("scripts/page1.R")

# Page One Sidebar Panel
p1_side <- sidebarPanel(
  h2("Cryptocurrency Comparison"),
  hr(),
  # Create Check boxes
  prettyCheckboxGroup(
    inputId = "checkboxInput",
    label = "Choose one or more cryptocurrencies",
    choices = list("Aave" = "AAVE", "Binance" = "BNB", "Cardano" = "ADA",
                   "Chainlink" = "LINK", "Cosmos" = "ATOM", "Doge" = "DOGE",
                   "Eos" = "EOS", "Ethereum" = "ETH", "Iota" = "MIOTA",
                   "Litecoin" = "LTC", "Monero" = "XMR", "Polkadot" =
                     "DOT", "Tether" = "USDT", "USD Coin" = "USDC",
                   "XRP" = "XRP"),
    selected = "DOGE"
  ))

#Page One main Panel
p1_main <-  mainPanel(
  h3("Introduction to Price and Market Cap"),
  hr(),
  p(introduction),
  br(),

  plotlyOutput("page_one_chart_price"),
  br(),
  plotlyOutput("page_one_chart_market"),
  br(),

  h3("Why compare Bitcoin?"),
  hr(),
  p(question),
  br(),
  h3("What can we learn from this?"),
  hr(),
  p(summ),
  br(),
  p(summ1)
)

# Full Page One
page_one <- tabPanel(
  "Growth Impact",
  titlePanel("Impact of Bitcoin Growth on Smaller Coins"),
  sidebarLayout(
    sidebarPanel = p1_side,
    mainPanel = p1_main
  ),
  position = "left"
) %>% tagAppendAttributes(class = "thin-center")

##### Interactive Page Two #####
# Create data frame that includes specific years
data_by_year <- all_coins %>%
  group_by(Date) %>%
  mutate(Date = substr(Date, 0, 4))

years <- c("2013", "2014", "2015", "2016", "2017", "2018",
           "2019", "2020", "2021")

# Page two side bar
page_two_sidebar_content <- sidebarPanel(
  selectInput(
    inputId = "year_input",
    label = "Choose a Year to Examine",
    choices = years,
    selected = 2021
  )
)

# Page two main panel
page_two_main_content <- mainPanel(plotlyOutput("page_two_chart"))

# Combine panels to create page 2 (interactive)
page_two <- tabPanel(
  "Importance by Volume",
  titlePanel("Most Important Cryptocurrencies in Day to Day Usage"),
  sidebarLayout(
    page_two_sidebar_content,
    page_two_main_content),
  fluidPage(
    includeCSS("www/app.css"),
    tags$h2("Interpretation"),
    tags$p(paste0(
      "Through this chart it is evident that there was a trend of Bitcoin"
      , " having the highest volume for quite a few years. There is a"
      , " distinct change however when we look at the 2019 data when"
      , " Tether passes Bitcoin in volume. Tether has remained the highest"
      , " in volume since 2019 but due to the nature of cryptocurrencies"
      , " this is subject to change. Before 2019 Tether was only reaching"
      , " half the volume that Bitcoin was reaching. Ethereum has"
      , " maintained a notable volume during these years and is well known"
      , " in today's world of cryptocurrencies. Bitcoin, Dogecoin,"
      , " Litecoin, XRP have been present in the cryptocurrency world since"
      , " 2013 and have somewhat maintained volume through the past eight"
      , " years."))
  )
) %>% tagAppendAttributes(class = "thin-center")

##### Interactive Page Three #####
source("scripts/page3.R")

page_three <- tabPanel(
  title = "Bitcoin vs. Ethereum",
  titlePanel("Comparing Volatility over Time for the Top Two Cryptocurrencies"),
  sidebarLayout(
    sidebarPanel = side,
    mainPanel = main
  )
) %>% tagAppendAttributes(class = "thin-center")

summary <- tabPanel(
  title = "Takeaways",
  titlePanel("Important Takeaways"),
  h2("Growth Impact"),
  hr(),
  p("Through this page we can see that the market trends of Bitcoin, the
  largest cryptocurrency does tend to influence the patterns of smaller coins.
  At the very least though we can see when interest in crypto currency has been
  the highest, particularlly the end of 2017 and the end of 2020 til now."),
  h2("Importance by Volume"),
  hr(),
  p("Through this chart it is evident that there was a trend of Bitcoin having
    the highest volume for quite a few years. There is a distinct change however
    when we look at the 2019 data when Tether passes Bitcoin in volume."),
  h2("Bitcoin vs Ethereum"),
  hr(),
  p(sum1),
  p(sum2),
  p(sum3),
  img(src = "both_2018.png"),
  br(),
  p(sum4),
  img(src = "both_2021.png"),
  br(),
  p(sum5)
) %>% tagAppendAttributes(class = "thin-center")

##### Navigation Bar (Overall Project) #####
ui <- navbarPage(
  "Cryptocurrency Analysis",
  theme = shinytheme("darkly"),
  home_page,
  about_page,
  page_one,
  page_two,
  page_three,
  summary
)
