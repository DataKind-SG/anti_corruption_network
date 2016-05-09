# Load data using 1-load-data.R script first

### 1. Procurement value by department ###
# Requirements
library(dplyr)
library(plotly)
library(htmlwidgets)

# Calculate sum of value by dept.
dt.value.by.dept <- dt.procurement %>%
  filter(!is.na(agreed_price_or_wages)) %>%  # remove NA
  group_by(procuring_department) %>%  # sum up total value by department
  summarize(total_value = sum(agreed_price_or_wages)) %>%
  mutate(topN = row_number(desc(total_value))) %>%  # derive ranking
  mutate(procuring_department = ifelse(topN <= 30, procuring_department, "Other")) %>%  # create "Other" category
  ungroup() %>%  # ungroup and sum up by dept. again
  group_by(procuring_department) %>%
  summarize(total_value = sum(total_value)) %>%
  arrange(desc(total_value))  # order by total value
View(dt.value.by.dept)

# Check
if ( sum(dt.value.by.dept$total_value) != sum(dt.procurement$agreed_price_or_wages, na.rm=TRUE) ) {
  warning("Total value not correct!")
}

# Plot
ch.proc.by.dept <- plot_ly(dt.value.by.dept, labels = procuring_department, values = total_value, type = "pie") %>%
  layout(title = "Procurement value by department")
saveWidget(as.widget(ch.proc.by.dept), file=paste(getwd(), "output", "Procurement processes by department.html", sep="/"), selfcontained=TRUE)
