#' @importFrom ggplot2 update_geom_defaults .pt

cieify_geom_defaults <- function() {
    # Define defaults for individual geoms in a style guide-consistent way

    # Note: looks as if update_geom_defaults() may be deprecated in a
    # future ggplot2
    # release (see https://github.com/tidyverse/ggplot2/pull/2749)
    #in favour of a new
    # way to update geom defaults; when this happens, replace the code below
    update_geom_defaults("point",
                         list(colour = cietheme::cie_lightorange,
                              size = 6 / .pt))
    update_geom_defaults("bar",
                         list(colour = "white",
                              fill = cietheme::cie_lightorange,
                              size = 0.75 / .pt))
    update_geom_defaults("col",
                         list(colour = "white",
                              fill = cietheme::cie_lightorange,
                              size = 0.75 / .pt))
    update_geom_defaults("line",
                         list(colour = cietheme::cie_lightorange,
                              size = 3 / .pt))
    update_geom_defaults("text",
                         list(colour = "black",
                              size = 18 / .pt))
    update_geom_defaults("smooth",
                         list(colour = cietheme::cie_lightorange,
                              fill = cietheme::cie_lightorange))

    update_geom_defaults("path",
                         list(colour = cietheme::cie_lightorange,
                              size = 3 / .pt))

    update_geom_defaults(ggrepel::GeomTextRepel,
                         list(size = 18 / .pt,
                              colour = "black"))

    update_geom_defaults(ggrepel::GeomLabelRepel,
                         list(size = 18 / .pt,
                              fill = "white",
                              colour = cietheme::cie_lightorange))

    update_geom_defaults("label",
                         list(size = 18 / .pt,
                              fill = "white",
                              colour = cietheme::cie_lightorange))

    update_geom_defaults("area",
                         list(fill = cietheme::cie_lightorange,
                              col = cietheme::cie_lightorange))

    update_geom_defaults("density",
                         list(fill = cietheme::cie_lightorange,
                              col = cietheme::cie_lightorange))

    update_geom_defaults("dotplot",
                         list(fill = cietheme::cie_lightorange,
                              col = cietheme::cie_lightorange))

    update_geom_defaults("polygon",
                         list(fill = cietheme::cie_lightorange,
                              col = cietheme::cie_lightorange))

    update_geom_defaults("path",
                         list(col = cietheme::cie_lightorange))

    update_geom_defaults("ribbon",
                         list(fill = cietheme::cie_lightorange,
                              col = cietheme::cie_lightorange))

    update_geom_defaults("rect",
                         list(fill = cietheme::cie_lightorange,
                              col = cietheme::cie_lightorange))

    update_geom_defaults("boxplot",
                         list(fill = cietheme::cie_orange_alpha,
                              col = cietheme::cie_lightorange))

    update_geom_defaults("crossbar",
                         list(fill = cietheme::cie_lightorange,
                              col = cietheme::cie_lightorange))

    update_geom_defaults("errorbar",
                         list(col = cietheme::cie_lightorange))

    update_geom_defaults("linerange",
                         list(col = cietheme::cie_lightorange))

    update_geom_defaults("pointrange",
                         list(col = cietheme::cie_lightorange))

    update_geom_defaults("tile",
                         list(col = "white",
                              fill = cietheme::cie_lightorange))
}
