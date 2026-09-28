README
Reproducible Materials for Figure 6

Title: Land Surface Phenology Reveals Region-Specific Hurricane Impacts Across the North Atlantic Basin over 22 Years

Purpose

This folder contains the datasets and R script required to reproduce Figure 6 of the manuscript.

Figure 6 presents the relationship between hurricane wind speed (km/h) and percent change in Enhanced Vegetation Index (ΔEVI, %) across six climate-derived subregions.

Panel (a): Percent change in EVI during the first winter after the storm.
Panel (b): Percent change in EVI during the first year after the storm.

Linear regressions are fit separately for each subregion. Regression lines, p-values, and R² values are displayed in the figure.

Files Included

Figure6_script.R
Figure6_inputs.RData
Figure6_Median_Wind_data.csv
Figure6a_pvalues.csv
Figure6a_rsq.csv
Figure6b_pvalues.csv
Figure6b_rsq.csv


Subregion Codes

Hurricane focal areas were grouped into six climate-derived subregions.

Code – Subregion

CA – Central America
C – Caribbean
FP – Florida Peninsula
SUS – Southeast US
SG – South Gulf
WG – West Gulf

Facet order used in plotting:

Florida Peninsula (FP)
Central America (CA)
Caribbean (C)
Southeast US (SUS)
South Gulf (SG)
West Gulf (WG)

Data Description

Figure6_Median_Wind_data.csv contains the point-level data used for both panels.

Key columns:

Clus_Acr – Subregion label
Wd_MedianKMh – Median hurricane wind speed (km/h)
PC_dEVI_1stWi – Percent change in EVI during first winter
PC_dEVI_1stYear – Percent change in EVI during first year

Figure6a_pvalues.csv and Figure6a_rsq.csv contain the p-values and R² values used for annotation in Panel (a).

Figure6b_pvalues.csv and Figure6b_rsq.csv contain the p-values and R² values used for annotation in Panel (b).

If included, the regression summary tables provide slope, intercept, R², p-value, and sample size for each subregion.

Statistical Approach

For each subregion, a linear regression model was fit:

ΔEVI ~ Wind Speed

Separate models were fit for:

First winter after storm
First year after storm

Regression lines were plotted without confidence intervals.
p-values correspond to the slope term of each regression model.

Software Requirements

R (version 4.3 or later recommended)

Required packages:

tidyverse
ggplot2
ggpubr

Install using:

install.packages(c("tidyverse","ggpubr"))

Reproducing Figure 6

Place all files in the same working directory.

Open Figure6_script.R in R or RStudio.

Run the script.

Outputs generated:

Figure6.png (600 dpi)
Figure6.pdf (vector format)

Reproducibility Notes

The script reads the provided CSV files directly.
No additional data processing beyond factor ordering and linear model fitting is performed.
The figure will reproduce identically when executed with the included datasets and script.