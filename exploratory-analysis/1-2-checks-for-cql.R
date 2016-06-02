# Requirements: 
# run 1-load-data.R first

# Dependencies
library(data.table)
library(dplyr)
library(magrittr)  # to use %<>% operator

# Identify unique key for rows

# Check which variable is unique for each row
n.rows <- nrow(dt.procurement)
dt.procurement.uniqueness <- dt.procurement %>%
  summarise_each(funs(cnt_distinct = length(unique(.))))
View(dt.procurement.uniqueness)  # --> there is no such variable

# Check duplicate entries
setkey(dt.procurement)
sum(duplicated(dt.procurement))  # --> 489 duplicated procurements

# Dedup procurements and check uniqueness again
dt.procurement %<>% unique(.)
dt.procurement.uniqueness <- dt.procurement %>%
  summarise_each(funs(cnt_distinct = length(unique(.))))
View(dt.procurement.uniqueness)  # --> still no primary key variable

length(unique(dt.procurement$project_name))
n_distinct(dt.procurement$project_name)
