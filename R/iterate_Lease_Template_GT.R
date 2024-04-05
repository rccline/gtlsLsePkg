#' Iterate Lease Template with PNG GT Tables
#'
#' This function iterates over `Lease_Template_GT.qmd` with PNG GT Tables,
#' rendering a Word document for each lease entry in the provided dataset.
#' The rendered documents are saved to the specified output directory.
#'
#' @param output_dir The directory where the output DOCX files will be saved.
#' This path should be writable and will contain the rendered reports.
#' If the directory does not exist, it will be created.
#'
#' @return Invisible `NULL`. The function is called for its side effects
#' (rendering and saving documents) and does not return a value.
#'
#' @examples
#' # Assuming `gtlsLsePkg` is installed and `leases2merge.xlsx` is available
#' # in the package's 'inst/data' directory:
#' iterate_Lease_Template_GT(output_dir = "path/to/save/reports")
#'
#' @import magrittr
#' @export
iterate_Lease_Template_GT <- function(output_dir = "output") {
  # Ensures the create_or_rewrite_output_folder function is available
  # and creates or clears the output directory.
  absolute_path <- create_or_rewrite_output_folder(output_dir)

  # Manual Confirmation Post-Directory Creation:
  # After the directory creation line, add a conditional check to assert the existence of the directory.
  if (!dir.exists(absolute_path)) {
    stop("Failed to create or find the output directory: ", absolute_path)
  }

  # Determine the path to the Word template
  word_template_path <- system.file("extdata", "word-template-legal.docx", package = "gtlsLsePkg")
  if (!nzchar(word_template_path)) {
    stop("Word template file not found.")
  }

  # Proceed with preparing the data for document rendering.
  leases0 <- readxl::read_excel(system.file("data", "leases2merge.xlsx", package = "gtlsLsePkg")) %>%
    dplyr::filter(LeaseID < 11) %>%
    dplyr::arrange(LeaseNo)

  # Extract necessary details for rendering.
  LeaseID <- leases0$LeaseID
  LeaseNo <- leases0$LeaseNo

  # Create reports tibble with input file, output file, and render params.
  reports <- dplyr::tibble(
    input = system.file("extdata", "lease_GT_template.qmd", package = "gtlsLsePkg"),
    output_file = purrr::map2_chr(LeaseNo, LeaseID, ~stringr::str_c(absolute_path, "/", .x, "-", .y, ".docx")),
    render_params = purrr::map2(LeaseID, LeaseNo, ~list(LeaseID = .x, LeaseNo = .y))
  )

  # Render R Markdown reports for each lease entry.
  purrr::pwalk(reports, function(input, output_file, render_params) {
    rmarkdown::render(
      input = input,
      output_file = output_file,
      params = render_params,
      output_format = rmarkdown::word_document(reference_docx = word_template_path)
    )
  })

  # The function does not return a value; it performs its operations as side effects.
  invisible(NULL)
}
