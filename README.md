## gtlsLsePkg R Package

### Created by Robert C. Cline, 2024

This lease package is in development.  This first version contains a data set to demonstrate how lease packages can be created using R's parameterizing functions.  Future versions will  contain a method to import your own data set with your own lease data.  The data included in this package are annonymized data for the purposes of an example only.  

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


### Support  
For questions or issues, please open an issue on the GitHub repository or contact me directly at [rccline@fastmail.fm].

### Contributing
Contributions to *gtlsLsePkg* are welcome!  

### License
This package is licensed under the MIT License. See the LICENSE file for more details.


