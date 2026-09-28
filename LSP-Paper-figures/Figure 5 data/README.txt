README
Reproducible Materials for Figure 5


Title: Land Surface Phenology Reveals Region-Specific Hurricane Impacts Across the North Atlantic Basin over 22 Years

Purpose

This folder contains the datasets and R script required to reproduce Figure 5 of the manuscript.

Figure 5 presents median seasonal land surface phenology (LSP) curves (EVI) for six climate-derived subregions across the North Atlantic Basin. The figure shows:

Median smoothed EVI trajectories (2000–2020)

Shaded ribbons representing ±1 standard deviation of original EVI

Vertical lines indicating median hurricane landfall timing

Separate panels for each subregion

The figure illustrates differences in seasonal phenological structure and landfall timing among subregions.

Files Included

Figure5_script.R

Figure5_day_month_medians_df_2025.csv
Figure5_REAL_EVI_LF_DEC2025.csv

Figure5_inputs.RData

Data Description

Figure5_day_month_medians_df_2025.csv

This file contains the smoothed median seasonal EVI values used to generate the curves and ribbons.
Figure5_inputs.RData is an R binary data file that contains the complete set of processed input objects required to reproduce Figure 5 of the manuscript.

The file preserves the original R object structures, including variable types (numeric, factor, character), ensuring exact graphical reproducibility without loss of metadata that may occur when exporting to CSV.
Key variables:

Cluster_NAMES – Subregion name
day_of_year – Day-of-year (1–365)
EVI_smooth_Imp_smoothed – Median smoothed EVI value
sd_original_EVI – Standard deviation of original EVI

Figure5_REAL_EVI_LF_DEC2025.csv

This file contains the median landfall day-of-year for each subregion.

Key variables:

Cluster_NAMES – Subregion name
day_of_year – Landfall day-of-year

Subregion Labels

The six subregions are:

Central America (CA)
South Gulf (SG)
Caribbean (C)
Florida Peninsula (FP)
Southeast US (SUS)
West Gulf (WG)

Panels are arranged in a 3-column layout with fixed ordering across subregions.

Plot Characteristics

X-axis: Month (derived from day-of-year)
Y-axis: EVI

Major features:

Solid line: Median smoothed EVI

Shaded ribbon: ±1 SD of original EVI

Vertical line: Median hurricane landfall date

Facet panels by subregion

Free x-scale per panel

Consistent axis styling and panel borders

Statistical Context

The curves represent climatological median seasonal EVI conditions for each subregion during 2000–2020.

Landfall timing corresponds to the median day-of-year for storms within each subregion.

No additional statistical modeling is performed in this script beyond graphical rendering.

Software Requirements

R (version 4.3 or later recommended)

Required packages:

ggplot2
grid

Install using:

install.packages("ggplot2")

Reproducing Figure 5

Place the script and data files in the same working directory.

Open Figure5_script.R in R or RStudio.

Run the script.

The script loads the data, constructs the faceted plot, and displays Figure 5.

Optional commands can save the figure as high-resolution PNG or PDF files.

Reproducibility Notes

The CSV files contain all numerical values required to reconstruct the figure.
The RData file (if provided) preserves the exact R objects used in the manuscript workflow.
Running the script with the included files will reproduce the published figure.