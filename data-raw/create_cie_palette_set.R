# Create CIE palette sets

# Assume more/higher is better; and better is yellow (can be reversed with reverse = TRUE)
#' The CIE colours
#'
#' These colours are used in \code{cie_plot} and form the basis for our
#' palettes.
#'
#' @export
cie_palette_set <- list(
  `full`  = c(cie_red,
              cie_darkorange,
              cie_lightorange,
              cie_yellow,
              cie_lightyellow),

  `full_f`  = c(cie_red_f,
                cie_darkorange_f,
                cie_lightorange_f,
                cie_yellow_f,
                cie_lightyellow_f),

  `light`  = c(cie_lightorange,
               cie_yellow,
               cie_lightyellow),

  `dark`   = c(cie_red, cie_darkorange,
               cie_lightorange),

  `diverging` = c(cie_red, cie_red_f,
                  "white",
                  cie_orange_f, cie_orange),

  `grey`  = c(cie_grey1,
              cie_grey2,
              cie_grey3,
              cie_grey4,
              cie_grey5)
)


usethis::use_data(cie_palette_set, overwrite = TRUE)
