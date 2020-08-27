= let func = 
(#"EMBED CODE" as text) =>
let
    url = #"EMBED CODE",
    resID = Text.BetweenDelimiters(#"EMBED CODE", "resid=", "&authkey"),
    authKey = Text.BetweenDelimiters(#"EMBED CODE", "&authkey=", "&em"),
    em = Text.BetweenDelimiters(#"EMBED CODE", "&em=", "&wdAllowInteractivity"),
    Source = Excel.Workbook(Web.Contents("https://onedrive.live.com/download?resid="&resID&"&authkey="&authKey&"&em="&em&"&app=Excel"), null, true)
    in
Source,
documentation = [
Documentation.Name =  " Get excel files from OneDrive Personal into Power BI
", Documentation.Description = " A function that has all the necessary code to get excel files from OneDrive for business.
" , Documentation.LongDescription = " This function requires only the embed code in excel.
", Documentation.Category = " Get data, create functions series
", Documentation.Source = " Link to youtube
", Documentation.Author = " Ruth Pozuelo Martinez: www.curbal.com .
", Documentation.Examples = {[Description =  " In excel, go to File > Share > Embed, and copy URL.
" , Code = "<iframe width=""402"" height=""346"" frameborder=""0"" scrolling=""no"" src=""https://onedrive.live.com/embed?resid=DC64707CDA0C02BF%21310&authkey=%21ALZN_NuNHbkL640&em=2&wdAllowInteractivity=False&wdHideGridlines=True&wdHideHeaders=True&wdDownloadButton=True&wdInConfigurator=True""></iframe>", 
Result = " ""https://onedrive.live.com/download?resid=DC64707CDA0C02BF%21310&authkey=%21ALZN_NuNHbkL640&em=2&app=Excel""
"]}] 
 in 
  Value.ReplaceType(func, Value.ReplaceMetadata(Value.Type(func), documentation))
