## gtlsLsePkg R Package

### Created by Robert C. Cline, 2024

The **gtlsLsePkg** R package automates the creation of lease packages by iterating through ownership data from one spreadsheet and tract descriptions from another related spreadsheet/table.

## Installation

Install the package directly from GitHub:

*devtools::install_github("username/gtlsLsePkg")  # Replace "username" with your GitHub username*  

## Getting Started
To use *gtlsLsePkg*, follow these steps:

1. Create a Project in RStudio (optional but recommended for managing related files).  
2. Load the Package:  
* `library(gtlssLsePkg)`  
3. Create a RMarkdown Document, or Script in your RSTudio project:  
* Load the package:  
  - `library(gtlsLsePkg)`  
* Run the main function to generate lease packages:    
  - `iterate_Lease_Template_GT()`   
  
An ouput folder will be created in your project and Lease packages for each owner will be created in the output folder.  


