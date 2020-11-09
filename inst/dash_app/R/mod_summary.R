#' summary UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList uiOutput
mod_summary_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(
        width = 12,
        h1("Summary")
      )
    ),
    fluidRow(
      col_4(
        bs4Dash::bs4ValueBoxOutput(ns("vb_num_cars"), width = 12)
      ),
      col_4(
        bs4Dash::bs4ValueBoxOutput(ns("vb_num_vars"), width = 12),
      ),
      col_4(
        bs4Dash::bs4ValueBoxOutput(ns("vb_avg_mpg"), width = 12)
      )
    )
  )
}

#' summary Server Function
#'
#' @noRd
#' @importFrom shiny moduleServer renderUI h1
mod_summary_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$vb_num_cars <- bs4Dash::renderbs4ValueBox({
      bs4Dash::bs4ValueBox(
        value = nrow(mtcars),
        subtitle = "Number of cars", 
        status = "primary",
        icon =  "car"
      )
    })
    
    output$vb_num_vars <- bs4Dash::renderbs4ValueBox({
      bs4Dash::bs4ValueBox(
        value = ncol(mtcars),
        subtitle = "Number of variables",
        status = "primary",
        icon = "info"
      )
    })
    
    output$vb_avg_mpg <- bs4Dash::renderbs4ValueBox({
      bs4Dash::bs4ValueBox(
        value = tags$span(
          round(mean(mtcars$mpg), 2),
          style = "color: #164b53; margin: 0px !important;"
        ),
        subtitle = tags$span(
          "Average mpg",
          style = "color: #164b53;"
        ),
        status = "secondary",
        icon = "gas-pump"
      )
    })
    
  })
}