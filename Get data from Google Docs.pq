let Docs=

(key as text)=>
let
    Source = Excel.Workbook(Web.Contents("https://docs.google.com/spreadsheets/d/"&key&"/export?format=xlsx"), null, true)
in 
Source,


documentation = [	
Documentation.Name =  "	Get Excel files from Google Docs
", Documentation.Description = "	Get Excel files from Google Docs
" , Documentation.LongDescription = "	Go to File> Share. From the link generated, copy the random numbers between /d/ and /edit?usp=sharing and paste them in the key text field below. Click Invoke.
", Documentation.Category = "	Accessing data functions
", Documentation.Source = "	local
", Documentation.Author = "	Ruth Pozuelo Martinez. www.curbal.com
", Documentation.Examples = {[Description =  "	
" , Code = "	A video coming up explains how this is done
 ", Result = "	
"]}]	
 in	
  Value.ReplaceType(Docs, Value.ReplaceMetadata(Value.Type(Docs), documentation))