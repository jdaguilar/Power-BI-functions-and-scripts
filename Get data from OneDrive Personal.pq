let func=
(resID as text, authKey as text, em as text)=>
let
    Source = Excel.Workbook(Web.Contents("https://onedrive.live.com/download?resid="&resID&"&authkey="&authKey&"&em="&em&"&app=Excel"), null, true),
    Tabell1_Table = Source{[Item="Tabell1",Kind="Table"]}[Data]
in
    Tabell1_Table,
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
