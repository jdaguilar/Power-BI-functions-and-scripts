
# 'dataset' holds the input data for this script
# CONNECT TO AN AZURE SQL DATABASE
library(RODBC)           # Provides database connectivity
 
# The Connection string comes from the Azure ODBC text box
connectionString <- "Driver={SQL Server Native Client 11.0};
Server=tcp:servername.database.windows.net,1433;
Databusername@servername;
Pwd=Password;
Encrypt=yes;
TrustServerCertificate=no;
Connection Timeout=30;"

#Open your RODBC connection
myconn <- odbcDriverConnect(connectionString)

sqlSave(myconn,dataset, tablename="tablename", rownames=FALSE, safer=FALSE, append=TRUE)
close(myconn)