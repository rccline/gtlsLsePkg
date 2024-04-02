############################################################
#                                                          #
#                      This R script                       #
#       defines a function create_or_rewrite_folder        #
#        that takes a folder_path as input. Here's         #
#               what it does:  It checks if                #
#    the folder specified by folder_path already exists    #
#        using dir.exists. If the folder exists, it        #
#        deletes the folder and its contents using         #
#          unlink. If the folder doesn't exist or          #
# after deletion, it creates the folder using dir.create.  #
#                                                          #
############################################################

create_or_rewrite_output_folder <- function() {
  folder_name <- "output"
  folder_path <- file.path(getwd(), folder_name)
  
  if (file.exists(folder_path)) {
    cat(paste("The folder '", folder_name, "' already exists. Deleting and rewriting...\n", sep = ""))
    tryCatch(
      {
        unlink(folder_path, recursive = TRUE)  # Delete the existing folder and its contents
      },
      error = function(e) {
        cat("Error:", e$message, "\n")
        return(FALSE)
      }
    )
  }
  
  # Create the folder
  if (!dir.create(folder_path)) {
    cat("Error: Unable to create the folder '", folder_name, "'\n")
    return(FALSE)
  }
  
  cat(paste("Folder '", folder_name, "' created successfully.\n", sep = ""))
  return(TRUE)
}

# Example usage:
create_or_rewrite_output_folder()
