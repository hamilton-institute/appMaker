#' data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_data_ui <- function(id){
  ns <- NS(id)
  tagList(
    reactable::reactableOutput(ns("data")) %>% 
      shinycssloaders::withSpinner(type = 4)
  )
}

#' data Server Function
#'
#' @noRd
mod_data_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$data <- reactable::renderReactable({
      reactable::reactable(
        data = datasets::mtcars,
        resizable = TRUE,
        filterable = TRUE,
        searchable = TRUE,
        showPageSizeOptions = TRUE,
        compact = TRUE,
        wrap = FALSE,
        highlight = TRUE,
        defaultPageSize = 10
      )
    })
    
  })
}
