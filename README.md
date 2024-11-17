## README for Hill-Burton Allocation Analysis

---

## Overview
This folder contains the necessary files and scripts used to analyze the allocation of Hill-Burton hospital construction funds across U.S. states from 1947 to 1964. The analysis addresses two key objectives:
1. **Assess the Relevance of Allotment Thresholds:** Examine the empirical relevance of the minimum (0.33) and maximum (0.75) allotment percentage values by analyzing their occurrence and practical impact.
2. **Predicted vs. Actual Allocations:** Evaluate whether the state-level allocations predicted by the Hill-Burton formula accurately reflect the actual federal allocations.

The analysis constructs a balanced panel dataset covering 48 states and provides insights through detailed graphical and tabular summaries comparing predicted and actual allocations.

---

## File Structure

### 1. **Data**
   The repository contains the following cleaned and processed datasets used for analysis:
   - **`panel_data.csv`:** A balanced panel dataset containing state-year predicted and actual Hill-Burton fund allocations.
   - **`final_allocations.csv`:** A dataset containing predicted allocations based on the Hill-Burton formula.

### 2. **R Scripts**
   - **`Analysis-of-Hill-Burton-Allocations.R`:** The main analysis script, organized into the following sections:
     1. **Evaluation of Allotment Percentages:**
        - Histograms and summary statistics analyzing the distribution of the 0.33 and 0.75 allotment thresholds.
     2. **Predicted vs. Actual Allocations:**
        - Regression analysis to assess the accuracy of predicted versus actual allocations.
        - Graphs illustrating predicted versus actual allocations.
        - A summary table highlighting key findings and discrepancies.

### 3. **Final Write-Up**
   - **`Investigating the Allocation of Hill-Burton Funding Across States`**: 
     - Comprehensive documentation of the methodology, dataset assembly, analysis, and findings.
     - Includes detailed regression results and a discussion of the alignment (or lack thereof) between predicted and actual allocations.

---

## Instructions for Running the Analysis

### 1. Set Up Your Working Environment
- Ensure your working directory is set to the location containing the data files and scripts. Update the `setwd()` command in the R script as needed.

### 2. Install Required R Libraries
- Install the following R packages to run the script:
  - `tidyverse`
  - `ggplot2`
  - `stargazer`
  - `knitr`

### 3. Run the Analysis Script
- Execute **`Analysis-of-Hill-Burton-Allocations.R`**, which will:
  - Generate histograms showing the distribution of allotment percentages.
  - Create a graph comparing predicted and actual allocations.
  - Produce a summary table of regression results evaluating the predictive accuracy of the Hill-Burton formula.

---

## Outputs

### Final Results
The analysis produces the following outputs:
1. **Graphs:**
   - **`allotment_pct_histogram.png`:** Visualizes the distribution of allotment percentages.
   - **`predicted_vs_actual_allocations.png`:** Compares predicted and actual allocations across states.
2. **Summary Table:**
   - **`regression_summary.txt`:** A text file containing regression results, detailing the alignment between predicted and actual allocations.
3. **Cleaned Datasets:**
   - **`panel_data.csv` and `final_allocations.csv`:** Ready-to-use datasets for further exploration.

---

## Contact

For any questions or feedback regarding this analysis, please contact:

**Gabriel Solis**  
Email: [solisgab@usc.edu](mailto:solisgab@usc.edu)
