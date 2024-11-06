
README: Data and Code for Hill-Burton Allocation Data Task for Professor Amy Finkelstein

Overview
This folder contains the necessary files and scripts used to analyze the allocation of Hill-Burton hospital construction funds across U.S. states from 1947 to 1964. The aim of this analysis is twofold:
1. Assess the empirical relevance of the minimum (0.33) and maximum (0.75) allotment percentage values by exploring their occurrence and impact in practice.
2. Evaluate whether the predicted state allocations based on the Hill-Burton formula are a good predictor of actual federal allocations.

The analysis includes the construction of a balanced panel dataset, covering 48 states, and provides insights through graphical and tabular summaries comparing predicted and actual allocations.

File Structure

1. /data/
   - /data/assembled/
     - Final datasets used in the analysis, including:
       - panel_data.csv: Balanced panel dataset containing state-year predicted and actual Hill-Burton funds allocations.
       - final_allocations.csv: Dataset containing predicted Hill-Burton allocations based on the allocation formula used for analysis.

2. R Scripts:
   - Analysis-of-Hill-Burton-Allocations.R: This script contains the analysis of the Hill-Burton allocations, which includes:
     1. Evaluation of Allotment Percentages:
        - Histograms and summary statistics to assess the occurrence of the minimum (0.33) and maximum (0.75) allotment percentage values.
     2. Predicted vs Actual Allocations:
        - A regression analysis comparing predicted versus actual Hill-Burton allocations.
        - Graphs illustrating the relationship between predicted and actual allocations.
        - A summary table showing the regression results and highlighting discrepancies.

3. Final Write Up:
   - The final write-up, titled *Investigating the Allocation of Hill-Burton Funding Across States*, documents the complete process of assembling the dataset and analyzing the results. It includes detailed descriptions of the methodology, results from the regression analysis, and the key findings on how well the predicted allocations matched the actual Hill-Burton funds across states. 

Instructions for Running the Code
1. Set Up Your Working Environment
- Ensure your working directory is set to the location where the data files and scripts are saved. Modify the setwd() command in the scripts if necessary.

2. Install Required Libraries
- The following R libraries are required to run the scripts:
  - tidyverse
  - ggplot2
  - stargazer
  - knitr

4. Run the Analysis Script
- Analysis-of-Hill-Burton-Allocations.R should be executed next. This script generates:
  - Histograms showing the distribution of allotment percentages.
  - A graph comparing predicted and actual Hill-Burton allocations.
  - A summary table of regression results, evaluating the accuracy of predictions.

Final Output
- The analysis produces:
  - Graphs such as allotment_pct_histogram.png and predicted_vs_actual_allocations.png.
  - A summary table of regression results saved as regression_summary.txt.
  - Cleaned datasets (panel_data.csv and final_allocations.csv) for further exploration.

Contact
For any questions regarding the analysis or code, please contact:

Gabriel Solis  
Email: solisgab@usc.edu
