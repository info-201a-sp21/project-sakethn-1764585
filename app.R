# Final Application

# Load Libraries
library(shiny)
library(tidyverse)
library(plotly)
library(shinyWidgets)

# Use source() to execute the app and define the UI Value and Server Function
source('ui.R')
source('server.R')

# Run the application 
shinyApp(ui = ui, server = server)
