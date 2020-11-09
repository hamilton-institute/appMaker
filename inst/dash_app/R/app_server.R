#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#'
#' @noRd
app_server <- function( input, output, session ) {

  mod_summary_server("ui_summary_1")
  mod_data_server("ui_data_1")
  
}
