# NOTE: Working directory must be set to location of this file first

# Requirements: run 
# > install.packages("libname")
# first if you don't have them installed already
library(data.table)
library(dplyr)
library(lubridate)

options(lubridate.fasttime = TRUE)  # makes as.POSIXct calls fast


# Load data
#s.file.location <- "sample-dataset/thai_procurement_data_sample.csv"
s.file.location <- "full-dataset/thai_procurement_data.csv"
s.file.location <- paste(getwd(), s.file.location, sep="/")
# Slower method using read.table
#dt.procurement <- as.data.table(read.table(s.file.location, header=TRUE, sep=",", fileEncoding="UTF-8", quote="\"", dec = ".", fill=TRUE, strip.white=TRUE, na.strings="(null)", stringsAsFactors=FALSE))
# Faster method using data.table::fread
dt.procurement <- fread(s.file.location, sep=",", dec=".", header=TRUE, strip.white=TRUE, na.strings="(null)", stringsAsFactors=FALSE
                       ,colClasses=list(integer64 = c("project_number")
                                       ,character = c("project_name", "procuring_department", "procurement_process", "tax_id_number", "bid_winner", "contract_number", "contract_status"
                                                    ,"tender_posted_date", "contract_sign_date")  # read 'em datez as char, convert later
                                       ,numeric   = c("budget", "reference_price", "agreed_price_or_wages")
                                       ,logical   = c("conditions_for_determination")))
# Convert date columns from character to POSIXct
v.sdcols = c("tender_posted_date", "contract_sign_date")
dt.procurement[, (v.sdcols) := lapply(.SD, function(x) as.POSIXct(x, format="%Y-%m-%d")), .SDcols=v.sdcols]



# Sample creation code
#n <- nrow(dt.procurement)
#v.smpl <- sample(n, floor(n*0.01))
#dt.procurement.smpl <- dt.procurement[v.smpl,] 
#write.table(dt.procurement.smpl, file="sample-dataset/thai_procurement_data_sample.csv", sep=",", fileEncoding="UTF-8", quote=TRUE, dec = ".", na="(null)", row.names=FALSE)
