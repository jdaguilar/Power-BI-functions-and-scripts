let func=
(resID as text, authKey as text, em as text)=>
let
    Source = Excel.Workbook(Web.Contents("https://onedrive.live.com/download?resid="&resID&"&authkey="&authKey&"&em="&em&"&app=Excel"), null, true),
    Tabell1_Table = Source{[Item="Tabell1",Kind="Table"]}[Data],
    #"Changed Type" = Table.TransformColumnTypes(Tabell1_Table,{{"Would you like me to continue making DAX Fridays! video tutorials?", type text}, {"Which function type would you like me to review more in depth?", type text}, {"Which other function type would you like next?", type text}, {"And lastly, which other function type would be your prio 3?", type text}, {"If any, which is your favourite DAX Video and why?", type any}, {"What 3 functions would you like to see a tutorial on?", type text}, {"Would you like me to do a video series on M language?", type text}, {"Which one is your least favorite and why?", type text}}),
    #"Renamed Columns" = Table.RenameColumns(#"Changed Type",{{"Would you like me to continue making DAX Fridays! video tutorials?", "Continue DAXFridays?"}, {"Which function type would you like me to review more in depth?", "Fav1"}, {"Which other function type would you like next?", "Fav2"}, {"And lastly, which other function type would be your prio 3?", "Fav3"}, {"Would you like me to do a video series on M language?", "M videos?"}}),
    #"Unpivoted Columns" = Table.UnpivotOtherColumns(#"Renamed Columns", {"Continue DAXFridays?", "If any, which is your favourite DAX Video and why?", "What 3 functions would you like to see a tutorial on?", "M videos?", "Which one is your least favorite and why?"}, "Attribute", "Value"),
    #"Renamed Columns1" = Table.RenameColumns(#"Unpivoted Columns",{{"Attribute", "Fav"}, {"Value", "Function"}})
in
    #"Renamed Columns1",
documentation = [
Documentation.Name =  " Get excel files from OneDrive Personal into Power BI
", Documentation.Description = " A function that has all the necessary code to get excel files from OneDrive for business.
" , Documentation.LongDescription = " This function requires three parameters, the resid,authkey and em. You will find the parameters in the embedd code in excel.
", Documentation.Category = " Get data, create functions series
", Documentation.Source = " Link to youtube
", Documentation.Author = " Ruth Pozuelo Martinez: www.curbal.com .
", Documentation.Examples = {[Description =  " In excel, go to File > Share > Embedd. From the embedd code get the 3 parameters and run the functiton.
" , Code = " resid:DC64707CDA0C02BF%21310, authkey==%21ALZN_NuNHbkL640, em=2
 ", Result = " ""https://onedrive.live.com/download?resid=DC64707CDA0C02BF%21310&authkey=%21ALZN_NuNHbkL640&em=2&app=Excel""
"]}] 
 in 
  Value.ReplaceType(func, Value.ReplaceMetadata(Value.Type(func), documentation))