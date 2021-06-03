# Get Dependencies
source("ui.R")
source("server.R")
source("scripts/dependencies.R")

# Entry Point into overall application
shinyApp(ui = ui, server = server)
