# ============================================================
# Figure 5 Script (Forests) - Median seasonal EVI by cluster
# Curves: median smoothed EVI by day-of-year (displayed as months)
# Ribbon: ± SD of original EVI
# Vlines: landfall day-of-year per cluster
# ============================================================

## 1) Libraries ------------------------------------------------
library(ggplot2)
library(grid)     # for unit()

## 2) Load data ------------------------------------------------
# Option A: load both objects at once
load("Figure5_inputs.RData")

# Option B: load separately (uncomment if needed)
# load("Figure5_day_month_medians_df_2025.RData")
# load("Figure5_REAL_EVI_LF_DEC2025.RData")

## 3) Define facet order --------------------------------------
facet_levels <- c(
  "Central America (CA)",
  "South Gulf (SG)",
  "Caribbean (C)",
  "Florida Peninsula (FP)",
  "Southeast US (SUS)",
  "West Gulf (WG)"
)

## 4) Build plot ----------------------------------------------
P11 <- ggplot(
  day_month_medians_df_2025,
  aes(
    x = day_of_year,
    y = EVI_smooth_Imp_smoothed,
    group = as.factor(Cluster_NAMES),
    color = as.factor(Cluster_NAMES)
  )
) +
  geom_line(size = 1) +
  geom_ribbon(
    aes(
      ymin = EVI_smooth_Imp_smoothed - sd_original_EVI,
      ymax = EVI_smooth_Imp_smoothed + sd_original_EVI,
      fill = as.factor(Cluster_NAMES)
    ),
    alpha = 0.2,
    color = NA
  ) +
  geom_vline(
    data = REAL_EVI_LF_DEC2025,
    aes(xintercept = day_of_year, color = as.factor(Cluster_NAMES)),
    linetype = "solid"
  ) +
  scale_x_continuous(
    breaks = seq(15, 360, by = 30.5),
    labels = c("1","2","3","4","5","6","7","8","9","10","11","12"),
    expand = c(0, 0)
  ) +
  scale_y_continuous(expand = c(0, 0)) +
  labs(
    x = "Month",
    y = "EVI",
    color = "Cluster",
    fill  = "Cluster",
    title = "Median EVI 2000-2020 by cluster/ Lines landfall date"
  ) +
  facet_wrap(
    ~factor(Cluster_NAMES, levels = facet_levels),
    ncol = 3,
    scales = "free_x"
  ) +
  theme(
    aspect.ratio = 1.75,
    panel.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.ticks = element_line(color = "black"),
    axis.text = element_text(color = "black", size = 8),
    axis.line = element_line(color = "black"),
    panel.border = element_rect(fill = NA, color = "black"),
    strip.placement = "outside",
    axis.ticks.length.x.top = unit(0.25, "cm"),
    axis.ticks.x.top = element_line(color = "black")
  )

## 5) Print / save --------------------------------------------
print(P11)

# Optional: save figure files
# ggsave("Figure5.png", P11, width = 10, height = 7, dpi = 600)
# ggsave("Figure5.pdf", P11, width = 10, height = 7)