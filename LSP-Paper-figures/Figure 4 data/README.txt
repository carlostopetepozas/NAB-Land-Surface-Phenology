README
Reproducible Materials for Figure 3
Manuscript submitted to Forests (MDPI)

Title: Land Surface Phenology Reveals Region-Specific Hurricane Impacts Across the North Atlantic Basin over 22 Years

Purpose

This folder contains the datasets and R script required to reproduce Figure 3 of the manuscript.

Figure 3 presents boxplots summarizing regional inter-seasonal and interannual variability (2001–2022) of:

(a) Enhanced Vegetation Index (EVI)
(b) Precipitation (mm)
(c) Temperature (°C)
(d) Vapor Pressure Deficit (kPa)

Hurricane focal areas are grouped into six climate-derived subregions.

Files Included

Figure3_script.R

EVI_box.csv

Precipitation_box.csv

Temperature_box.csv

VPD_box.csv

Subregion Codes

The six subregions were derived using k-means clustering of long-term climate variables (2000–2022).

Code – Subregion

CA – Central America
SG – South Gulf
C – Caribbean
FP – Florida Peninsula
SUS – Southeast US
WG – West Gulf

Cluster order used in plotting:

CA → SG → C → FP → SUS → WG

Data Sources

EVI data:
MODIS Terra (MOD13A1) and Aqua (MYD13A1) 500 m 16-day composites.

Climate variables:
TerraClimate 4 km monthly dataset (precipitation, maximum temperature, vapor pressure deficit).

The CSV files included here contain processed and aggregated values used directly for Figure 3.

Software Requirements

R (version 4.3 or later recommended)

Required R packages:

tidyverse

ggplot2

viridis

ggpubr

Install packages in R using:

install.packages(c("tidyverse","viridis","ggpubr"))

Reproducing Figure 3

Place all files in the same working directory.

Open Figure3_script.R in R or RStudio.

Run the script.

Outputs generated:

Figure3_Boxplots.png (600 dpi)

Figure3_Boxplots.pdf (vector format)

Reproducibility Notes

The script reads the included CSV files directly.

No additional data transformation beyond factor ordering is performed.

The figure will reproduce identically using the provided data and script.