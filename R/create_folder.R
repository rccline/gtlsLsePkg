#' Create or Rewrite Output Folder
#'
#' This function creates a new folder at the specified path or clears an existing folder
#' if it already exists.
#'
#' @param folder_path The path of the folder to create or clear. Default is "output".
#'
#' @return The absolute path of the created or cleared folder.
#'
#' @examples
#' create_or_rewrite_output_folder("path/to/output")
#'
#' @export
create_or_rewrite_output_folder <- function(folder_path = "output") {
  absolute_path <- normalizePath(folder_path, mustWork = FALSE)

  if (dir.exists(absolute_path)) {
    cat(paste("The folder '", absolute_path, "' already exists. Deleting and recreating it...\n", sep = ""))
    unlink(absolute_path, recursive = TRUE)
  }

  dir.create(absolute_path, recursive = TRUE, showWarnings = FALSE)
  cat(paste("Folder '", absolute_path, "' created or cleared successfully.\n", sep = ""))

  return(absolute_path)
}
