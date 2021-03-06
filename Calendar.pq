let
    // The List.Dates function that returns a list of dates
    Source = List.Dates,
    // Invoke List.Dates function. Here you need to specify the dates you want the list to invoke.
    // From Date: # Date (YYYY,MM,DD)
    // To Date:  Duration.Days(DateTime.Date(DateTime.FixedLocalNow())-  #date(YYYY, MM, DD))+1  (It counts the number of days between today and the first date of the table and adds one day more to include today).
    // To adapt this to your own calender table change the values for (YYYY; MM; DD)
    // #duration (1,0,0,0) instructs List.Date to do one day increments in the list.
    #"Invoke dates" = Source(#date(2014,07,11), Duration.Days(DateTime.Date(DateTime.FixedLocalNow())- #date(2014,07,11))+1, #duration(1, 0, 0, 0)),
    // This step will convert the list to a table.
    #"List to table" = Table.FromList(#"Invoke dates", Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    //Rename column to Date
    Date = Table.RenameColumns(#"List to table",{{"Column1", "Date"}}),
    // Extract Day from Date column and add leading zeros “00”
    #"Day Added" = Table.AddColumn(Date, "Day", each Text.PadStart(Number.ToText(Date.Day([Date])),2,"0")),
    // Extract Day Name from Date column using american names.
    // Navigate here for other Languages not included in the parameters: https://msdn.microsoft.com/en-us/goglobal/bb896001.aspx
    #"Day Name Added" = Table.AddColumn(#"Day Added", "Day Name", each Date.ToText([Date],"ddd","en-US")),
    //Extract Month No from Date column    
    #"Month No Added" = Table.AddColumn(#"Day Name Added", "Month No", each Date.Month([Date])),
    // Extract Month Name from Date column.
    // Navigate here for other Languages: https://msdn.microsoft.com/en-us/goglobal/bb896001.aspx
    #"Month Name Added" = Table.AddColumn(#"Month No Added", "Month Name", each Date.ToText([Date],"MMM","en-US")),
    //Extract Quarter No from Date column
    #"Quarter No Added" = Table.AddColumn(#"Month Name Added", "Quarter No", each Date.QuarterOfYear([Date])),
    // Extract Week No from Date column, add +1 to match European week numbering and add leading zeros
    #"Week No added" = Table.AddColumn(#"Quarter No Added", "WeekNo", each Text.PadStart(Number.ToText(Date.WeekOfYear([Date])-1),2,"0")),
    // Extract Year from Date column
    #"Year Added" = Table.AddColumn(#"Week No added", "Year", each Date.Year([Date])),
    // Concatenate Year and Month Name
    #"Year Month Added" = Table.AddColumn(#"Year Added", "Year-Month", each Number.ToText([Year])&"-"&[Month Name]),
    // Concatenate Year and Quarter No with leading zeros on quarter Nos
    #"Year Quarter Added" = Table.AddColumn(#"Year Month Added", "Year-Quarter", each Number.ToText([Year]) & "Q"& Number.ToText([Quarter No],"00")),
    //Change field types to TEXT
    #"Change type to text" = Table.TransformColumnTypes(#"Year Quarter Added",{{"Year", type text}, {"Date", type date}, {"Month No", type text}, {"Day", type text}, {"Day Name", type text}, {"Month Name", type text}, {"Quarter No", type text}, {"Year-Quarter", type text}, {"Year-Month", type text}, {"WeekNo", type text}}),
    // Extract Day No from Date column
    #"Sort Day" = Table.AddColumn(#"Change type to text", "SortDay", each Date.Day([Date])),
    // Concatenate Year and Day of the Week to create a column to sort the previously created WeekNo column
    #"Sort DayName" = Table.AddColumn(#"Sort Day", "SortDayName", each Date.DayOfWeek([Date],1)),
    // Extract Week No from Date column and add 1 week to match European numbering
    #"Sort Week No" = Table.AddColumn(#"Sort DayName", "SortWeekNo", each Date.WeekOfYear([Date])+1),
    //Concatenate Year and Month Number to create a column to sort the previously created MonthYear column 
    #"Sort YearMonth" = Table.AddColumn(#"Sort Week No", "SortYearMonth", each [Year]&Text.PadStart([Month No],2,"0")),
    //Concatenate Year and Quarter Number to create a column to sort the previously created QuarterYear column 
    #"Sort YearQuarter" = Table.AddColumn(#"Sort YearMonth", "SortYearQuarter", each [Year]&Text.PadStart([Quarter No],2,"0")),
    //Change the field type for the sort columns to numbers
    #"Changed Type to NO" = Table.TransformColumnTypes(#"Sort YearQuarter",{{"SortYearMonth", Int64.Type}, {"SortYearQuarter", Int64.Type}, {"SortDayName", Int64.Type}, {"SortDay", Int64.Type}, {"SortWeekNo", Int64.Type}})
in
    #"Changed Type to NO"
