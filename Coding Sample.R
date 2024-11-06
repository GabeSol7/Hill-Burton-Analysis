########################################################
# Title: Analysis of Hill-Burton Allocation Percentages and Predictions
# Subtitle:  Investigating the allocation of Hill-Burton funding across states
#
#
# Purpose: This R script addresses two questions related to the empirical relevance of the Hill-Burton 
# state allocation formula:
# 1. Assess whether the minimum (0.33) and maximum (0.75) allotment percentage values 
#    are empirically relevant by exploring their occurrence and impact in practice.
# 2. Evaluate whether the predicted state allocations based on the formula are a good predictor 
#    of actual federal Hill-Burton funding allocations. This is done by presenting:
#    - A graph comparing predicted vs actual allocations.
#    - A table summarizing the accuracy of predictions and identifying discrepancies.
#
# Author: Gabriel Solis (solisgab@usc.edu)
########################################################

# Setting working directory
setwd("~/Desktop/Solis_Gabriel_Data Task_Amy Finkelstein/Data/Assembled Data")

# Loading in relevant packages
library(tidyverse)
library(viridis)
library(ggplot2)
library(knitr)
library(stargazer)

# Loading in panel dataset
panel <- read.csv('panel_data.csv')
allocations <- read.csv('final_allocations.csv') # To answer question 1



###########################################################
#
#       Assessing the Empirical Relevance of 
#   Minimum (0.33) and Maximum (0.75) Allotment Percentages
#
###########################################################

# Calculate the count of observations at the min (0.33) and max (0.75) thresholds
threshold_counts <- allocations %>%
  summarize(
    min_count = sum(allotment_pct == 0.33),
    max_count = sum(allotment_pct == 0.75),
    total_obs = n()
  )

print(threshold_counts)

# Plot histogram of allotment percentages
ggplot(allocations, aes(x = allotment_pct)) +
  geom_histogram(binwidth = 0.01, fill = "#4169E1", color = "white", alpha = 0.8) +
  geom_vline(xintercept = c(0.33, 0.75), color = "#2F4F4F", linetype = "dashed", size = 0.7) +
  scale_x_continuous(limits = c(0.3, 0.8), breaks = seq(0.3, 0.8, 0.1)) +
  labs(x = "\nAllotment Percentage", y = "Frequency\n") +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(color = "gray90"),
    axis.title = element_text(face = "bold"),
    plot.margin = margin(t = 10, r = 10, b = 10, l = 10, unit = "pt")
  )

ggsave("allotment_pct_histogram.png", width = 8, height = 6)

# Calculate yearly percentages of states at min (0.33) and max (0.75)
yearly_percentages <- allocations %>%
  group_by(year) %>%
  summarize(
    pct_at_min = mean(allotment_pct == 0.33) * 100,
    pct_at_max = mean(allotment_pct == 0.75) * 100
  )

# Display the yearly percentages as a table
kable(yearly_percentages, digits = 1, col.names = c("Year", "% at Minimum", "% at Maximum"))

# Calculate and print overall percentages at min (0.33) and max (0.75)
overall_pct_min <- mean(allocations$allotment_pct == 0.33) * 100
overall_pct_max <- mean(allocations$allotment_pct == 0.75) * 100

cat("Overall percentage at minimum (0.33):", round(overall_pct_min, 1), "%\n")
cat("Overall percentage at maximum (0.75):", round(overall_pct_max, 1), "%\n")



###########################################################
#                                                           
#       Evaluate Predicted vs Actual Hill-Burton 
#               Allocations with a Graph and Table
#                                                           
###########################################################

panel_clean <- panel %>% 
  drop_na(predicted, hbfunds)

model <- lm(hbfunds ~ predicted, data = panel_clean)


ggplot(panel_clean, aes(x = predicted, y = hbfunds)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "red") +
  labs(
    x = "\nPredicted Allocation ($)",
    y = "Actual Allocation ($)\n",
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    plot.caption = element_text(hjust = 0, face = "italic")
  ) +
  scale_x_continuous(labels = scales::dollar_format(scale = 1e-6, suffix = "M")) +
  scale_y_continuous(labels = scales::dollar_format(scale = 1e-6, suffix = "M"))

ggsave("predicted_vs_actual_allocations.png", width = 10, height = 6, dpi = 300)


summary_table <- stargazer(model, type = "text", 
                           title = "Regression of Actual on Predicted Allocations",
                           covariate.labels = c("Predicted Allocation"),
                           dep.var.labels = "Actual Allocation")

# Save the summary table
writeLines(summary_table, "regression_summary.txt")



