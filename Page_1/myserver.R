
source("Charts1.R")

server<-function(input,output){
output$page_one_chart_price <- renderPlotly({
  selected_coin <- input$checkboxInput
  draw_da_plot_price(all_coins, selected_coin)
})

output$page_one_chart_market <- renderPlotly({
  selected_coin <- input$checkboxInput
  draw_da_plot_market(all_coins, selected_coin)
})
}