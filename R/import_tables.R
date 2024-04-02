# Load the RODBC package
library(RODBC)

# Specify the path to your MS Access database file
access_file <- "E:/GTLS-Params/data/GTLS_DB.accdb"

# Establish a connection to the MS Access database
conn <- odbcDriverConnect(paste("Driver={Microsoft Access Driver (*.mdb, *.accdb)};",
                                "DBQ=", access_file, sep=""))

# Import each table into a separate dataframe
tblLessors <- sqlFetch(conn, "tblLessors")
tblLseTracts <- sqlFetch(conn, "tblLseTracts")
tblLeases <- sqlFetch(conn, "tblLeases")

# Close the database connection
odbcClose(conn)

# Now you can work with the imported dataframes in R
# For example, you can print the first few rows of each dataframe
head(tblLessors)
head(tblLseTracts)
head(tblLeases)
