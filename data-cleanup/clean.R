library(data.table)
library(bit64)

# Load the data
data_thai <- fread("../input/thai_procurement_data.csv")

# Remove NULLS from all columns
removeNull <- function(x) {
  x <- ifelse(x=="(null)","",x)
  return(x)
}
data_thai <- as.data.table(apply(data_thai,2,FUN=removeNull))

# Remove duplicate rows
data_thai <- unique(data_thai)

# Set the primary key
setkey(data_thai,project_number,tax_id_number,contract_number,contract_status,contract_sign_date)

# Fix the date fields
data_thai$tender_posted_date <- as.Date(data_thai$tender_posted_date,"%Y-%m-%d")
data_thai$contract_sign_date <- as.Date(data_thai$contract_sign_date,"%Y-%m-%d")
data_thai$diff_contract_tender <- data_thai$contract_sign_date - data_thai$tender_posted_date

# Fix the numeric fields
data_thai$budget <- as.numeric(data_thai$budget)
data_thai$reference_price <- as.numeric(data_thai$reference_price)
data_thai$agreed_price_or_wages <- as.numeric(data_thai$agreed_price_or_wages)

# Remove the blank column conditions_for_determination
data_thai$conditions_for_determination <- NULL

# Create factors for category variables
data_thai$contract_status <- as.factor(data_thai$contract_status)
data_thai$procurement_process <- as.factor(data_thai$procurement_process)
data_thai$procuring_department <- as.factor(data_thai$procuring_department)

# Write the cleaned file
write.csv(data_thai,"../output/thai_procurement_data_cleaned.csv",row.names = F)


