//Download data to sql from Power query using R where the data is appended

library(RODBC)
conn <- odbcDriverConnect("driver=SQL Server;server=.\\SQLEXPRESS;Database=<databasename>;Uid=<sa>;
Pwd=<password>")
odbcClearError(conn)
sqlSave(conn, dataset, tablename="<tablename>",rownames=FALSE, safer=FALSE, append=TRUE)
close(conn)

//Download data to sql from Power query using R where the data is appended without duplicates By Nelon Roy
library(RODBC)
conn <- odbcDriverConnect("driver=SQL Server; server=.\\SQLEXPRESS; Database=SQLDB")
odbcClearError(conn)
sqlClear(conn, "tablename")
sqlSave(conn, dataset, tablename="TABLE_NAME",rownames=FALSE, safer=FALSE, append=TRUE)
close(conn)


Tutorial here:
https://www.youtube.com/watch?v=ANIZkTZO3eU
