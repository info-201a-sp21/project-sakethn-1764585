# Set up
library("pacman")
pacman::p_load(pacman, party, rio, tidyverse, psych, knitr, shiny, plotly, quantmod,dplyr)

#Load Ui and server 
source("myui.R")
source("myserver.R")

shinyApp(ui = ui, server = server)