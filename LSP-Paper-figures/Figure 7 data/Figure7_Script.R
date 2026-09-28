# ============================================================
# Figure 7 Script (Forests MDPI) — Case-study LSP panels (All lands)
# Goal: reproduce the SAME final multi-panel figure output (2 x 3; shared legend bottom)
# Inputs: six .RData files, each containing a ggplot object:
#   p_charley, p_laura, p_iota, p_emily, p_maria, p_harvey
# ============================================================

## 1) Libraries ------------------------------------------------
library(ggplot2)
library(ggpubr)

## 2) (Optional) record package versions ----------------------
packageVersion("ggplot2")
packageVersion("ggpubr")

## 3) Working directory + load saved plot objects --------------
# NOTE: For editorial support, prefer using a relative path or instruct the user to setwd().


# Each file is expected to load one ggplot object into the environment.
load("CHARLEY_FMASK_ALLLANDS_PLOT6.RData")
load("LAURA_FMASK_ALLLANDS_PLOT6.RData")
load("HARVEY_FMASK_ALLLANDS_PLOT6.RData")
load("IOTA_FMASK_ALLLANDS_PLOT6.RData")
load("EMILY_FMASK_ALLLANDS_PLOT6.RData")
load("MARIA_FMASK_ALLLANDS_PLOT6.RData")

## 4) Add panel titles (as in manuscript) ----------------------
p_charley <- p_charley + ggtitle(expression(bold("(a)") * " Charley | FP"))
p_laura   <- p_laura   + ggtitle(expression(bold("(b)") * " Laura | SUS"))
p_harvey  <- p_harvey  + ggtitle(expression(bold("(c)") * " Harvey | WG"))
p_iota    <- p_iota    + ggtitle(expression(bold("(d)") * " Iota | CA"))
p_emily   <- p_emily   + ggtitle(expression(bold("(e)") * " Emily | SG"))
p_maria   <- p_maria   + ggtitle(expression(bold("(f)") * " Maria | C"))

## 5) Collect plots in final display order (2 x 3) -------------
plots <- list(
  p_charley, p_iota,
  p_laura,   p_emily,
  p_harvey,  p_maria
)

## 6) Styling helpers (keep final output figure) ---------------
# 6.1 Standardize curve and landfall-vertical-line widths
set_layer_linewidths <- function(p, curve_lw = 0.7, vline_lw = 0.8) {
  for (i in seq_along(p$layers)) {
    if (inherits(p$layers[[i]]$geom, "GeomLine")) {
      p$layers[[i]]$aes_params$linewidth <- curve_lw
    }
    if (inherits(p$layers[[i]]$geom, "GeomVline")) {
      p$layers[[i]]$aes_params$linewidth <- vline_lw
    }
  }
  p
}

# 6.2 X-axis: yearly labels + monthly minor ticks; rotate labels
# Uses ggplot_build() to infer x-range robustly from plotted data.
add_year_month_axis <- function(p,
                                year_tick_lw   = 0.40,
                                month_tick_lw  = 0.35,
                                year_tick_len  = 4.5,
                                month_tick_len = 2.5,
                                x_text_size    = 7) {
  
  b  <- ggplot_build(p)
  xs <- unlist(lapply(b$data, `[[`, "x"), use.names = FALSE)
  xs <- xs[is.finite(xs)]
  if (length(xs) == 0) return(p)
  
  dmin <- as.Date(min(xs), origin = "1970-01-01")
  dmax <- as.Date(max(xs), origin = "1970-01-01")
  
  y0 <- as.Date(sprintf("%d-01-01", as.integer(format(dmin, "%Y"))))
  y1 <- as.Date(sprintf("%d-01-01", as.integer(format(dmax, "%Y"))))
  m0 <- as.Date(format(dmin, "%Y-%m-01"))
  m1 <- as.Date(format(dmax, "%Y-%m-01"))
  
  p +
    scale_x_date(
      breaks       = seq(y0, y1, by = "1 year"),
      labels       = function(x) format(x, "%Y"),
      minor_breaks = seq(m0, m1, by = "1 month"),
      expand       = expansion(mult = c(0.01, 0.01))
    ) +
    guides(x = guide_axis(minor.ticks = TRUE)) +
    theme(
      axis.title.x = element_blank(),
      axis.text.x  = element_text(angle = 90, vjust = 0.5, hjust = 1, size = x_text_size),
      
      # enforce ticks (some source plots may start with axis.ticks = element_blank())
      axis.ticks       = element_line(linewidth = year_tick_lw),
      axis.minor.ticks = element_line(linewidth = month_tick_lw),
      
      axis.ticks.length       = unit(year_tick_len,  "pt"),
      axis.minor.ticks.length = unit(month_tick_len, "pt")
    )
}

## 7) Apply styling in a clear, reproducible order -------------
plots2 <- lapply(plots, set_layer_linewidths, curve_lw = 0.7, vline_lw = 0.8)
plots2 <- lapply(plots2, add_year_month_axis)

## 8) Arrange final multi-panel figure (SAME final output) -----
row_heights <- rep(1, 3)
row_heights[3] <- 0.95  # slightly shrink bottom row

Figure7 <- ggarrange(
  plotlist = plots2,
  ncol = 2, nrow = 3,
  heights = row_heights,
  align = "v",
  common.legend = TRUE,
  legend = "bottom"
)

print(Figure7)

# ============================================================
# End of script
# ============================================================