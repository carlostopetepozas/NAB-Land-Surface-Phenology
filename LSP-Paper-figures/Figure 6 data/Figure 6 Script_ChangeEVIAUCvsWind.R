# ============================================================
# Figure 6 Script - Forests (MDPI)
# Wind vs %ΔEVI by subregion
# (a) First winter after storm
# (b) First year after storm
# Original dot style (no shape mapping)
# ============================================================

## 1) Load libraries ------------------------------------------
library(tidyverse)
library(ggpubr)

## 2) Load data ------------------------------------------------

 load("Figure6_inputs.RData")

## 3) Define facet order --------------------------------------
facet_levels <- c(
  "Florida Peninsula (FP)",
  "Central America (CA)",
  "Caribbean (C)",
  "Southeast US (SUS)",
  "South Gulf (SG)",
  "West Gulf (WG)"
)

## 4) Panel (a): First winter ---------------------------------

p5_1stWinter <- ggplot(Median_Wind,
                       aes(x = Wd_MedianKMh,
                           y = PC_dEVI_1stWi)) +
  
  geom_point(
    aes(color = Clus_Acr),
    size = 2,
    position = position_jitterdodge(jitter.width = 0.2,
                                    dodge.width = 0.5)
  ) +
  
  geom_smooth(method = "lm",
              se = FALSE,
              aes(group = Clus_Acr,
                  color = Clus_Acr)) +
  
  scale_color_manual(
    values = c(
      "Florida Peninsula (FP)" = "red",
      "Central America (CA)" = "gold3",
      "Caribbean (C)" = "green3",
      "Southeast US (SUS)" = "cyan3",
      "South Gulf (SG)" = "royalblue",
      "West Gulf (WG)" = "magenta2"
    )
  )+
  geom_hline(yintercept = 0,
             linetype = "dashed",
             color = "black") +
  
  geom_text(data = p_value_data_DectoFeb,
            aes(x = 125, y = 0.08,
                label = paste0("p=", round(p_value_DectoFeb, 3))),
            vjust = -1,
            hjust = 0,
            size = 3) +
  
  geom_text(data = rsq_data_DectoFeb,
            aes(x = 125, y = 0.03,
                label = paste0("R^2=", round(rsq_DectoFeb, 3))),
            vjust = -1,
            hjust = 0,
            size = 3) +
  
  theme(
    aspect.ratio = 1,
    panel.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.ticks = element_line(color = "black"),
    axis.text = element_text(color = "black", size = 8),
    axis.line = element_line(color = "black"),
    panel.border = element_rect(fill = NA, color = "black"),
    plot.title = element_text(size = 11)
  ) +
  
  labs(x = "Wind (km/h)",
       y = expression(Delta~EVI~"(%)")) +
  
  facet_wrap(~factor(Clus_Acr, levels = facet_levels)) +
  
  ggtitle(expression(bold("(a)") * " First winter after the storm"))

print(p5_1stWinter)

## 5) Panel (b): First year -----------------------------------

p5_1yrauc <- ggplot(Median_Wind,
                    aes(x = Wd_MedianKMh,
                        y = PC_dEVI_1stYear)) +
  
  geom_point(
    aes(color = Clus_Acr),
    size = 2,
    position = position_jitterdodge(jitter.width = 0.2,
                                    dodge.width = 0.5)
  ) +
  
  geom_smooth(method = "lm",
              se = FALSE,
              aes(group = Clus_Acr,
                  color = Clus_Acr)) +
  
  scale_color_manual(
    values = c(
      "Florida Peninsula (FP)" = "red",
      "Central America (CA)" = "gold3",
      "Caribbean (C)" = "green3",
      "Southeast US (SUS)" = "cyan3",
      "South Gulf (SG)" = "royalblue",
      "West Gulf (WG)" = "magenta2"
    )
  )+
  
  geom_hline(yintercept = 0,
             linetype = "dashed",
             color = "black") +
  
  geom_text(data = p_value_data_auc,
            aes(x = 125, y = -0.14,
                label = paste0("p=", round(p_value_auc, 3))),
            vjust = -1,
            hjust = 0,
            size = 3) +
  
  geom_text(data = rsq_data_auc,
            aes(x = 125, y = -0.20,
                label = paste0("R^2=", round(rsq_auc, 3))),
            vjust = -1,
            hjust = 0,
            size = 3) +
  
  theme(
    aspect.ratio = 1,
    panel.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.ticks = element_line(color = "black"),
    axis.text = element_text(color = "black", size = 8),
    axis.line = element_line(color = "black"),
    panel.border = element_rect(fill = NA, color = "black"),
    plot.title = element_text(size = 11)
  ) +
  
  labs(x = "Wind (km/h)",
       y = expression(Delta~EVI~"(%)")) +
  
  facet_wrap(~factor(Clus_Acr, levels = facet_levels)) +
  
  ggtitle(expression(bold("(b)") * " First year after the storm"))

print(p5_1yrauc)

## 6) Combine --------------------------------------------------

Figure6 <- ggarrange(p5_1stWinter,
                     p5_1yrauc,
                     nrow = 1,
                     common.legend = TRUE,
                     legend = FALSE)

print(Figure6)

## 7) Save -----------------------------------------------------

ggsave("Figure6.png", Figure6, width = 8, height = 10, dpi = 600)
ggsave("Figure6.pdf", Figure6, width = 8, height = 10)
ggsave("Figure6_lndscape.tiff", Figure6, width = 8, height = 10, dpi = 200)
ggsave("Figure6_v8.landdscape", Figure6, width = 8, height = 10, dpi = 200)
