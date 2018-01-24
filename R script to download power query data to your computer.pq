# 'dataset' holds the input data for this script
require(gdata)
csvFileName <- paste("C:/Users/<username>/<directory>/<filename>",".csv",sep = "")
write.csv(trim(dataset), file=csvFileName)
plot(dataset);


Tutorial on how to use this file:
https://www.youtube.com/watch?v=56FV6x8vYyQ

//Installation links needed for R:
Link to download R: https://goo.gl/eOA8We
Link to download Rstudio: https://goo.gl/TF1xKq

//pagages needed installed in R
install.packages("gdata")

