#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#'
#' @importFrom bs4Dash tabPanel tabsetPanel updateTabsetPanel dashboardPage dashboardControlbar dashboardHeader dashboardSidebar bs4SidebarMenu bs4SidebarMenuItem dashboardBody bs4TabItems bs4TabItem dashboardFooter
#' @importFrom shiny a tagList icon
#'
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    hamiltonThemes::use_bs4Dash_distill_css(),
    # List the first level UI elements here
    dashboardPage(
      enable_preloader = FALSE,
      old_school = FALSE,
      sidebar_mini = TRUE,
      sidebar_collapsed = FALSE,
      controlbar_collapsed = TRUE,
      controlbar_overlay = TRUE,
      # loading_background = "#4682B4",
      title = "App title",

      #---
      controlbar = dashboardControlbar(),

      #---
      navbar = bs4Dash::bs4DashNavbar(
        skin = "light",
        status = "light",
        border = TRUE,
        sidebarIcon = "bars",
        compact = FALSE,
        controlbarIcon = "th"
      ),

      #---
      sidebar = dashboardSidebar(
        skin = "light",
        status = "primary",
        brandColor = "dark",
        title = "TITLE",
        bs4SidebarMenu(
          bs4SidebarMenuItem(
            "Summary",
            tabName = "summary",
            icon = "bullseye"
          ),
          bs4SidebarMenuItem(
            "Data",
            tabName = "data",
            icon = "database"
          )
        )
      ),

      #---
      body = dashboardBody(
        hamiltonThemes::use_bs4Dash_distill_theme(), # <-- use the theme
        bs4TabItems(
          bs4TabItem(
            tabName = "summary",
            mod_summary_ui("ui_summary_1")
          ),
          bs4TabItem(
            tabName = "data",
            mod_data_ui("ui_data_1")
          )
        )
      ),

      #---
      hamiltonThemes::bs4dash_distill_footer()
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @importFrom shiny tags
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  
  shinyjs::useShinyjs()
  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(ext = "png"),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'TITLE'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

