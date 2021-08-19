library(shiny)

ui <- fluidPage(
  sliderInput("x", "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", "and y is", min = 1, max = 50, value = 5),
  "then, (x * y) is", textOutput("product_plus0"),
  "and, (x * y) + 5 is", textOutput("product_plus5"),
  "and (x * y) + 10 is", textOutput("product_plus10")
)

server <- function(input, output, session) {

  product_plus <- function(z) {
    renderText({
        product <- input$x * input$y
        product + z
    })
  }

  output$product_plus0 <- product_plus(0)
  output$product_plus5 <- product_plus(5)
  output$product_plus10 <- product_plus(10)
}

shinyApp(ui, server)
