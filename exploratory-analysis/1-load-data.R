# NOTE: Working directory must be set to location of this file first

# Requirements: run 
# > install.packages("libname")
# first if you don't have them installed already
library(data.table)
library(dplyr)

# Load data
#s.file.location <- "sample-dataset/thai_procurement_data_sample.csv"
s.file.location <- "full-dataset/thai_procurement_data.csv"
s.file.location <- paste(getwd(), s.file.location, sep="/")
dt.procurement <- as.data.table(read.table(s.file.location, header=TRUE, sep=",", fileEncoding="UTF-8", quote="\"", dec = ".", fill=TRUE, strip.white=TRUE, na.strings="(null)", stringsAsFactors=FALSE))


# Sample creation code
#n <- nrow(dt.procurement)
#v.smpl <- sample(n, floor(n*0.01))
#dt.procurement.smpl <- dt.procurement[v.smpl,] 
#write.table(dt.procurement.smpl, file="sample-dataset/thai_procurement_data_sample.csv", sep=",", fileEncoding="UTF-8", quote=TRUE, dec = ".", na="(null)", row.names=FALSE)
