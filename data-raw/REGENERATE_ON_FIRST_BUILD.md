# Regenerate data files before first build

The `.rda` files in `data/` and `R/sysdata.rda` were generated under the
original `grattantheme` package and contain objects with the upstream
names.  After cloning `cietheme` for the first time, run (from an R
session at the package root):

```r
# Internal sysdata (logogrob, chart_types, etc.)
source("data-raw/create sysdata.R")

# Exported palette set
source("data-raw/create_cie_palette_set.R")

# all_geoms list
source("data-raw/all_geoms.R")
```

The package `R/cie_pal.R` references `cietheme::cie_palette_set`, which
will not exist until `create_cie_palette_set.R` is re-run.
