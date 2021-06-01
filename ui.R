#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

##### Home Page ##### 
  introduction_page <- fluidPage(
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "app.css")
    ),
    p(em("Overview: "), "Cryptocurrencies are a form of currency where the value 
      comes not from a trust in any government/centralized authority, but
      rather from a trust in cryptography and the mathematical properties
      of a data structure known as the blockchain. "),
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
)
  
  home_page <- tabPanel(
    "Home Page",
    titlePanel("Cryptocurrencies: A Data Driven Analysis"),
    introduction_page
  )
  
##### Interactive Page One #####   
  page_one <- tabPanel(
    "Growth Impact",
    titlePanel("Impact of Growth"),
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
  )
   #selectInput(
    #inputID = "color_input",
    #label = "Choose a Color:",
    #choices = c("red", "orange", "green", "blue", "purple")
  )
  
  # Page two main panel
  page_two_main_content <- mainPanel(theme="app.css",
                                     plotlyOutput("page_two_chart"),
                                     )
  
  # Combine panels to create page 2 (interactive)
  page_two <- tabPanel(theme ="app.css",
    "Importance by Volume",
    titlePanel("Most Important in Day to Day Usage"),
    sidebarLayout(
      page_two_sidebar_content,
      page_two_main_content),
    fluidPage(theme = "app.css",
              tags$h2("Interpretation"),
              tags$p("Through this chart it is evident that...")
              )
    )
  
  
  
  # Create chart two for second interactive page
  
  ##### Interactive Page Three ##### 
  page_three <- tabPanel(
    "Bitcoin and Ethereum Compared",
    titlePanel("Two top cryptocurrencies compared")
  ) 
  

 
ui <- navbarPage(
  "Cryptocurrency Analysis",
  home_page,
  page_one,
  page_two,
  page_three)

