#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
  
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
  
  page_one <- tabPanel(
    "Growth Impact",
    titlePanel("Impact of Growth"),
  )
  
  page_two <- tabPanel(
    "Most Important",
    titlePanel("Most Important in Day to Day Usage")
  )
  
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

