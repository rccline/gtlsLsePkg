#' Iterates Lease Template with PNG GT Tables
#' 
#' This function iterates over Lease_Template_GT.Rmd with PNG GT Tables
#' 
#' @export
iterate_Lease_Template_GT <- function() {
  # Function implementation goes here

library(tidyverse)
library(rmarkdown)
library(readxl)
library(here)

############################################################
#                                                          #
#        This script iterates Lease_Template_GT.Rmd        #
#                    with PNG GT Tables                    #
#                                                          #
############################################################


# Read the Excel file and filter data
leases0 <- read_excel(here("data/leases2merge.xlsx")) %>% 
 filter(LeaseID < 11) %>% 
  arrange(LeaseNo)

# Extract LeaseID and LeaseNo from the dataframe
LeaseID <- leases0$LeaseID
LeaseNo <- leases0$LeaseNo

# Create reports tibble with input file, output file, and render params
reports <- tibble(
 # input =   here::here("docs/Lease_Template_GT.Rmd"),
  input = system.file("inst/doc/Lease_Template_GT.Rmd", package = "gtlsTools"),
  output_file = str_c("../output/", format(LeaseNo, nsmall = 2, digits = 4), "-", LeaseID, ".docx"),
  render_params = map2(LeaseID, LeaseNo, ~list(LeaseID = .x, LeaseNo = .y))
)

# CALL SCRIPT TO CREATE OR CLEAR OUTPUT FOLDER  

source(here::here("scripts/create_folder.R"))


# Render R Markdown reports
pwalk(reports, function(input, output_file, render_params) {
  rmarkdown::render(input = input, 
                    output_file = output_file, 
                    output_format = "word_document",
                    params = render_params)
})
}