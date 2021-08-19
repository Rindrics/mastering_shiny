library(shiny)

ui <- fluidPage(
  sliderInput("x", "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", "and y is", min = 1, max = 50, value = 5),
  textOutput("product_plus0"),
  textOutput("product_plus5"),
  textOutput("product_plus10")
)

server <- function(input, output, session) {

  product_plus <- function(conj, z) {
    renderText({
        product <- input$x * input$y
        prodstr <- "(x * y)"
        if (z == 0) {
            paste0(conj, prodstr, " is ", product + z)
        } else {
            paste0(conj, prodstr, " + ", z, " is ", product + z)
        }
    })
  }

  output$product_plus0 <- product_plus("then, ", 0)
  output$product_plus5 <- product_plus("and, ", 5)
  output$product_plus10 <- product_plus("and ", 10)
}

shinyApp(ui, server)
