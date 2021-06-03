#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(shinyWidgets)
source("scripts/dependencies.R")

# Load Data
source("scripts/dependencies.R")

##### Home Page #####
introduction_page <- fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "app.css"),
    tags$style(HTML("
                    body {
                      margin: 0;
                    }"))
  ),
  tags$div(tags$div(
    h1("Cryptocurrencies: A Data Driven Analysis"),
    p(em("Overview: "), "Cryptocurrencies are a form of currency where the value
      comes not from a trust in any government/centralized authority, but
      rather from a trust in cryptography and the mathematical properties
      of a data structure known as the blockchain. ") %>%
      tagAppendAttributes(style = 'width: 500px;'),
  ) %>%
    tagAppendAttributes(class = 'titleStyle')) %>%
    tagAppendAttributes(class = 'bgStyle')


)

##### About Page #####
about_content <- fluidPage(
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
         href="https://www.kaggle.com/sudalairajkumar/cryptocurrencypricehistory"),
  tags$br(),
  tags$a("Ethereum Blockchain Data",
         href="https://www.kaggle.com/kingburrito666/ethereum-historical-data")
)

about_page <- tabPanel(
  "About",
  about_content
)

home_page <- tabPanel(
  "Home Page",
  introduction_page
)

##### Interactive Page One #####
source("Page_1/descriptions.R")
# Page One Sidebar Panel
p1_side<-sidebarPanel(
  h2("Cryptocurrency Comparison"),
  hr(),
  # Create Check boxes
  prettyCheckboxGroup(
    inputId = "checkboxInput",
    label = "Choose one or more cryptocurrencies",
    choices = list("Aave" = 'AAVE', "Binance" = 'BNB', "Cardano" = 'ADA',
                   "Chainlink" = 'LINK', "Cosmos" = 'ATOM', "Doge" = 'DOGE',
                   "Eos" = 'EOS', "Ethereum" = 'ETH', "Iota" = 'MIOTA',
                   "Litecoin" = 'LTC', "Monero" = 'XMR', "Polkadot" =
                     'DOT', "Tether" = 'USDT', "USD Coin" = 'USDC',
                   "XRP" = 'XRP'),
    selected = 'DOGE'
  ))
#Page One main Panel

p1_main<-  mainPanel(
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
)

##### Interactive Page Two #####
# Create data frame that includes specific years
data_by_year <- all_coins %>%
  group_by(Date) %>%
  mutate(Date = substr(Date, 0,4))

years <- c("2013", "2014", "2015", "2016", "2017", "2018",
           "2019", "2020", "2021")

# Page two side bar
page_two_sidebar_content <- sidebarPanel(theme ="app.css",
                                         selectInput(
                                           inputId = "year_input",
                                           label = "Choose a Year to Examine",
                                           choices = years,
                                           selected = 2021
                                         ))

# Page two main panel
page_two_main_content <- mainPanel(theme="app.css",
                                   plotlyOutput("page_two_chart")
)

# Combine panels to create page 2 (interactive)
page_two <- tabPanel(theme ="app.css",
                     "Importance by Volume",
                     titlePanel("Most Important Cryptocurrencies in Day to Day Usage"),
                     sidebarLayout(
                       page_two_sidebar_content,
                       page_two_main_content),
                     fluidPage(theme = "app.css",
                               tags$h2("Interpretation"),
                               tags$p("Through this chart it is evident that there was a trend of Bitcoin having the highest volume for quite a few years. There is a distinct change however when we look at the 2019 data when Tether passes Bitcoin in volume. Tether has remained the highest in volume since 2019 but due to the nature of cryptocurrencies this is subject to change. Before 2019 Tether was only reaching half the volume that Bitcoin was reaching. Ethereum has maintained a notable volume during these years and is well known in today's wolrd of cryptocurrencies. Bitcoin, Dogecoin, Litecoin, XRP have been present in the cryptocurrency world since 2013 and have somewhat maintained volume through the past eight years.")
                     )
)

# Create chart two for second interactive page

##### Interactive Page Three #####

source("Page_3/candlestick.R")
source("Page_3/helper.R")

page_three <- tabPanel(
  title = "Bitcoin vs. Ethereum",
  titlePanel("Comparing Volatility over Time for the Top Two Cryptocurrencies"),
  sidebarLayout(
    sidebarPanel = side,
    mainPanel = main
  )
)

summary <- tabPanel(
  title = "Takeaways",
  titlePanel("Important Takeaways"),
  h2("Growth Impact"),
  h2("Importance by Volume"),
  h2("Bitcoin vs Ethereum"),
  p(sum1),
  p(sum2),
  p(sum3),
  img(src = "Page_3/both_2018.png"),
  p(sum4),
  img(src = "Page_3/both_2021.png"),
  p(sum5)
)

##### Navigation Bar #####
ui <- navbarPage(
  "Cryptocurrency Analysis",
  home_page,
  about_page,
  page_one,
  page_two,
  page_three,
  summary
)
