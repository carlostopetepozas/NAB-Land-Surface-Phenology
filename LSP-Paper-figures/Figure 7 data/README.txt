README
Reproducible Materials for Figure 7
Manuscript submitted to Forests (MDPI)

Title: Land Surface Phenology Reveals Region-Specific Hurricane Impacts Across the North Atlantic Basin over 22 Years

Purpose

This folder contains the datasets and R script required to reproduce Figure 6 of the manuscript.

Figure 7 presents six case-study land surface phenology (LSP) time series panels for major hurricanes across different climate-derived subregions. Each panel shows smoothed EVI trajectories before and after landfall, including a vertical line indicating hurricane landfall timing.

The panels are arranged in a 2 × 3 layout with a shared legend.

Files Included

Figure7_script.R

CHARLEY_FMASK_ALLLANDS_PLOT6.RData
LAURA_FMASK_ALLLANDS_PLOT6.RData
HARVEY_FMASK_ALLLANDS_PLOT6.RData
IOTA_FMASK_ALLLANDS_PLOT6.RData
EMILY_FMASK_ALLLANDS_PLOT6.RData
MARIA_FMASK_ALLLANDS_PLOT6.RData

Additionally all the Hurricanes are condensed in the following xlsx file

Fig7DataLSP.xlsx

Each .RData file contains a pre-built ggplot object corresponding to one hurricane case study.

Case Study Panels

(a) Charley | FP (Florida Peninsula)
(b) Laura | SUS (Southeast US)
(c) Harvey | WG (West Gulf)
(d) Iota | CA (Central America)
(e) Emily | SG (South Gulf)
(f) Maria | C (Caribbean)

Panels are arranged in the following order:

Charley | Iota
Laura | Emily
Harvey | Maria

Data Description

Each .RData file loads a ggplot object (e.g., p_charley, p_laura, etc.) that includes:

Smoothed EVI time series (MODIS-based)

Landfall timing represented as a vertical reference line

Pre- and post-storm trajectories

Shared legend for land-cover categories

The time axis represents dates derived from MODIS 16-day composites.

Figure styling standardizes:

Line widths for curves and landfall indicators

Yearly major ticks

Monthly minor ticks

Rotated x-axis labels

Compact multi-panel layout

Software Requirements

R (version 4.3 or later recommended)

Required packages:

ggplot2
ggpubr

Install using:

install.packages(c("ggplot2","ggpubr"))

Reproducing Figure 7

Place all .RData files and the script in the same working directory.

Open Figure7_script.R in R or RStudio.

Run the script.

The script:

Loads each ggplot object

Applies standardized styling (line widths and axis formatting)

Arranges panels into a 2 × 3 layout

Displays the final figure

The final figure corresponds exactly to Figure 7 in the manuscript.

Reproducibility Notes

The .RData files contain pre-generated ggplot objects constructed from processed MODIS EVI time series data.
No additional statistical transformation is performed in this script beyond graphical styling and panel arrangement.
Running the script with the provided files reproduces the published figure layout and formatting.