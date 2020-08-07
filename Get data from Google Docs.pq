let Docs=

(key as text)=>
let
    new_url = Text.Replace(#"GOOGLE SHEET URL", "edit?usp=sharing", "export?format=xlsx"),
    Source = Excel.Workbook(Web.Contents(new_url), null, true)
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
" , Code = "	https://www.youtube.com/watch?v=2hFCeduIP6k
 ", Result = "	
"]}]	
 in	
  Value.ReplaceType(Docs, Value.ReplaceMetadata(Value.Type(Docs), documentation))
