# ============================================================
# Figure 4 Script - Minimal Reproducible
# Boxplots: EVI, Precipitation, Temperature, VPD by subregion
# Inputs: EVI_box.csv, Precipitation_box.csv, Temperature_box.csv, VPD_box.csv
# Outputs: Figure4_Boxplots.png, Figure4_Boxplots.pdf
# ============================================================

## 1) Libraries ------------------------------------------------
library(tidyverse)
library(viridis)
library(ggpubr)

## 2) Load data (current working directory) --------------------
EVI_box  <- read.csv("EVI_box.csv")
P_data   <- read.csv("Precipitation_box.csv")
MT_data  <- read.csv("Temperature_box.csv")
VPD_data <- read.csv("VPD_box.csv")

## 3) Define cluster order -------------------------------------
cluster_levels <- c("CA", "SG", "C", "FP", "SUS", "WG")

## 4) Standardize factor levels --------------------------------
# Panel a uses Cluster_Acr; panels b–d use Clus_Acr
EVI_box <- EVI_box %>%
  mutate(Cluster_Acr = factor(Cluster_Acr, levels = cluster_levels))

P_data <- P_data %>%
  mutate(Clus_Acr = factor(Clus_Acr, levels = cluster_levels))

MT_data <- MT_data %>%
  mutate(Clus_Acr = factor(Clus_Acr, levels = cluster_levels))

VPD_data <- VPD_data %>%
  mutate(Clus_Acr = factor(Clus_Acr, levels = cluster_levels))

## 5) Build plots ----------------------------------------------

# ---- a) EVI ----
EVI_plot <- ggplot(EVI_box, aes(x = Cluster_Acr, y = EVI_smooth_Imp)) +
  geom_boxplot(aes(fill = Cluster_Acr),
               color = "black", width = 0.5, size = 0.7, outlier.size = 0.7) +
  labs(x = "Cluster", y = "EVI") +
  scale_fill_viridis_d(begin = 0.5, end = 0.95) +
  theme_minimal() +
  theme(aspect.ratio = 2.5) +
  ggtitle("a)")

# ---- b) Precipitation ----
Precip_plot <- ggplot(P_data, aes(x = Clus_Acr, y = value)) +
  geom_boxplot(aes(fill = Clus_Acr),
               color = "black", width = 0.5, size = 0.7, outlier.size = 0.7) +
  labs(x = "Cluster", y = "Precipitation (mm)") +
  scale_x_discrete(expand = c(0.1, 0.1)) +
  scale_fill_viridis_d(begin = 0.5, end = 0.95) +
  theme_minimal() +
  theme(aspect.ratio = 2.5) +
  ggtitle("b)")

# ---- c) Temperature ----
Temp_plot <- ggplot(MT_data, aes(x = Clus_Acr, y = value)) +
  geom_boxplot(aes(fill = Clus_Acr),
               color = "black", width = 0.5, size = 0.7, outlier.size = 0.7) +
  labs(x = "Cluster", y = "Temperature (°C)") +
  scale_x_discrete(expand = c(0.1, 0.1)) +
  scale_fill_viridis_d(begin = 0.5, end = 0.95) +
  theme_minimal() +
  theme(aspect.ratio = 2.5) +
  ggtitle("c)")

# ---- d) VPD ----
VPD_plot <- ggplot(VPD_data, aes(x = Clus_Acr, y = value)) +
  geom_boxplot(aes(fill = Clus_Acr),
               color = "black", width = 0.5, size = 0.7, outlier.size = 0.7) +
  labs(x = "Cluster", y = "Vapor Pressure Deficit (kPa)") +
  scale_x_discrete(expand = c(0.1, 0.1)) +
  scale_fill_viridis_d(begin = 0.5, end = 0.95) +
  theme_minimal() +
  theme(aspect.ratio = 2.5) +
  ggtitle("d)")

## 6) Arrange panels -------------------------------------------
Figure4 <- ggarrange(
  EVI_plot, Precip_plot, Temp_plot, VPD_plot,
  common.legend = TRUE,
  legend = "bottom",
  nrow = 1
)
Figure4
## 7) Save figure ----------------------------------------------
ggsave("Figure4_Boxplots.png", Figure4, width = 14, height = 5, dpi = 600)
ggsave("Figure4_Boxplots.pdf", Figure4, width = 14, height = 5)

# ============================================================
# End
# ============================================================