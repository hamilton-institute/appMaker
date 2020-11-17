#' Create distill themed dashboard
#'
#' @param path Path to the new directory
#' @param title App title
#'
#' @export
create_dash <- function(path, title = NULL) {

  dir <- fs::dir_ls(system.file("dash_app", package = "appMaker"), all = TRUE)
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  file.copy(dir, path, recursive = TRUE, overwrite = TRUE)
  new_dir <- dir(normalizePath(path), full.names = TRUE)

  files <- "golem-config|app_config\\.R|DESCRIPTION|app\\.R$|README|01_start\\.R"
  
  files_to_replace <- dir(
    dirname(new_dir),
    full.names = TRUE,
    recursive = TRUE,
    pattern = files
  )
  
  packageName <- stringr::str_remove_all(basename(path), "_|-")

  purrr::walk(
    files_to_replace,
    replace_text_from_file,
    "PACKAGENAME",
    packageName
  )

  if (!is.null(title)) {
    # Arquivo app_ui.R
    app_ui_file <- dir(new_dir[grepl("R$", new_dir)],
                       full.names = TRUE, pattern = "app_ui")

    replace_text_from_file(app_ui_file, "TITLE", title)
  }

  usethis::proj_activate(path)
}

replace_text_from_file <- function(file, pattern, text) {
  txt <- readr::read_file(file)
  txt <- gsub(pattern, text, txt)
  readr::write_file(txt, file)
}


#' Create distill themed app
#'
#' @param path Path to the new directory
#' @param title App title
#'
#' @export
create_simple_app <- function(path = ".", title = NULL) {
  
  dir <- fs::dir_ls(system.file("simple_app", package = "appMaker"), all = TRUE)
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  file.copy(dir, path, recursive = TRUE, overwrite = TRUE)
  new_dir <- dir(normalizePath(path), full.names = TRUE)
  
  usethis::proj_activate(path)
}

replace_text_from_file <- function(file, pattern, text) {
  txt <- readr::read_file(file)
  txt <- gsub(pattern, text, txt)
  readr::write_file(txt, file)
}

