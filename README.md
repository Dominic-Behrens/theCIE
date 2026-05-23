
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![R-CMD-check](https://github.com/dominic-behrens/thecie/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/dominic-behrens/thecie/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

<!-- badges: end -->

# cietheme

Create ggplot2 charts in The CIE (Centre for International Economics)
style.

`cietheme` is a fork of
[grattantheme](https://github.com/grattan/grattantheme) rebranded for
The CIE. All public symbols have been renamed from `grattan_*` to
`cie_*`, and from `theme_grattan()` to `theme_cie()`. Base colour hex
codes are placeholders pending the CIE brand palette.

## Install cietheme

``` r
# install.packages("pak")
pak::pak("dominic-behrens/thecie")
```

``` r
library(cietheme)
```

## Make your charts look nice

Use `theme_cie()` to format your ggplot2 charts in a style consistent
with the CIE style guide, including elements such as gridline colours
and line width, font size, etc. For scatter plots,
`theme_cie(chart_type = "scatter")` provides a black y-axis. For charts
with discrete values on the y-axis, `theme_cie(flipped = TRUE)` provides
a vertical axis line and rotates gridlines (auto-detected for
`coord_flip()` and horizontal bar charts).

Use `scale_y_continuous_cie()` (or `scale_x_continuous_cie()` if
flipped) to set default values for your vertical axis that will work
well with most CIE charts.

A range of colours from the style guide (such as `cie_lightorange`,
`cie_darkred`, and so on) are defined for your convenience. Each colour
has eight tints available, e.g. `cie_lightorange` has lighter variants
`cie_lightorange1` through `cie_lightorange8` (closest to white). These
can be used to allow highlighting or when filling in block colours
behind text, such as when designing tables.

Use `theme_cie(background = "box")` to create a chart for a CIE report
box.

## Save your nice looking charts

Use `cie_save()` to save your ggplot2 charts (eg. as `.png` or `.pdf`
files) for use elsewhere, such as in Powerpoint or LaTeX with the size
and resolution set to style guide-consistent values. See `?cie_save()`
for size presets. Use `cie_save(save_pptx = TRUE)` (or the standalone
`cie_save_pptx()`) for Powerpoint output, and `cie_save(save_data = TRUE)`
(or `save_chartdata()`) to also write the chart data to xlsx.

Save your chart in all CIE formats — along with chart data — using
`cie_save_all()`.

## Acknowledgements

`cietheme` is forked from
[`grattantheme`](https://github.com/grattan/grattantheme) by Matt
Cowgill, Will Mackey and contributors at the Grattan Institute, released
under MIT licence.
