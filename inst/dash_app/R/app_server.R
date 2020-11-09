#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#'
#' @noRd
app_server <- function( input, output, session ) {

  mod_sumario_server("ui_summary_1")
  mod_dados_server("ui_data_1")
  
}
