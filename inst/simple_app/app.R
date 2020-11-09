library(shiny)

ui <- bs4Dash::bs4DashPage(
  sidebar_collapsed = TRUE,
  sidebar_mini = FALSE,
  body = bs4Dash::bs4DashBody(
    fresh::use_theme(hamiltonCovid19::theme_bs4Dash()),
    fluidRow(
      bs4Dash::column(
        width = 4,
        br(),
        selectInput(
          "variable",
          label = "Select a variable:",
          choices = names(mtcars)
        )
      ),
      bs4Dash::column(
        width = 8,
        br(),
        h4(style = "color: black;", "Figure guide:"),
        p(style = "color: black;", "Each point relates to a car model."),
        plotOutput("plot")
      )
    )
  ),
  footer = bs4Dash::dashboardFooter(
    copyrights = a(
      href = "https://www.maynoothuniversity.ie/hamilton",
      target = "_blank", "Hamilton Institute"
    ),
    right_text = "2020 | developed by Hamilton Institute"
  )
)

server <- function(input, output, session) {
  output$plot <- renderPlot(
    ggplot2::ggplot(
      mtcars, 
      ggplot2::aes_string(x = input$variable, y = "mpg")
    ) +
      ggplot2::geom_point()
  )
}

shiny::shinyApp(ui, server)