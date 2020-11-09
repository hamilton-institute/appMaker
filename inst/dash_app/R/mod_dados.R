#' dados UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_dados_ui <- function(id){
  ns <- NS(id)
  tagList(
    reactable::reactableOutput(ns("dados")) %>% shinycssloaders::withSpinner(type = 4)
  )
}

#' dados Server Function
#'
#' @noRd
mod_dados_server <- function(id) {
  moduleServer(id, function(input, output, session) {
      
    output$dados <- reactable::renderReactable({
      reactable::reactable(
        data = datasets::mtcars,
        resizable = TRUE,
        filterable = TRUE,
        searchable = TRUE,
        showPageSizeOptions = TRUE,
        compact = TRUE,
        wrap = FALSE,
        highlight = TRUE,
        defaultPageSize = 10,
        defaultColDef = reactable::colDef(footer = function(values) {
          if (!is.numeric(values)) return()
          
          if(length(unique(values)) > 15) {
            values <- cut(values, breaks = 15)
          }
          
          sparkline::sparkline(
            table(values),
            type = "bar",
            width = 130,
            height = 30,
            barColor = status_para_cor("primary")
          )
        })
      )
    })
    
  })
}

