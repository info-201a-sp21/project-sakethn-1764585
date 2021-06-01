ui<- fluidPage(
  
sidebarLayout(
  sidebarPanel(
    h2("Cryptocurrency Comparison"),
    checkboxGroupInput(
      inputId = "checkboxInput",
      label = h3("Choose one or more cryptocurrencies"),
      choices = list("Aave" = 'AAVE', "Binance" = 'BNB', "Cardano" = 'ADA',
                     "Chainlink" = 'LINK', "Cosmos" = 'ATOM', "Doge" = 'DOGE',
                     "Eos" = 'EOS', "Ethereum" = 'ETH', "Iota" = 'MIOTA',
                     "Litecoin" = 'LTC', "Monero" = 'XMR', "Polkadot" =
                       'DOT', "Tether" = 'USDT', "USD Coin" = 'USDC', 
                     "XRP" = 'XRP'))),
  mainPanel(
    plotlyOutput(
      outputId = "priceovertime"
    ),
    plotlyOutput(
      outputId = "marketcapovertime"
    )
    ),
position = "left")
)
    

 
  




