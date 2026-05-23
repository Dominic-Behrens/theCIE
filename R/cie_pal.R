#' Predefined CIE colours combined into palettes
#'
#' This is a list of CIE colours combined into palettes. The palettes are used
#' for different plots and maps.
#' @export
cie_palettes <- list(
  `graph` = c(cie_orange,
              cie_red,
              cie_yellow,
              cie_darkorange,
              cie_darkred,
              cie_lightyellow,
              cie_blue,
              cie_darkblue,
              cie_lightgrey,
              cie_darkgrey),
  `sequential` = c(cie_darkred, cie_orange, cie_yellow),
  `diverging` = c(cie_darkred, cie_orange, cie_blue)
)


#' Set the palette order as needed in the
#'
#' This is a list of CIE colours combined into palettes. The palettes are used
#' for different plots and maps.
#' @export
palette_order <- list(
  `old` =
                                c(
                                  cie_lightyellow,
                                  cie_yellow,
                                  cie_orange,
                                  cie_darkorange,
                                  cie_red,
                                  cie_darkred,
                                  cie_blue,
                                  cie_darkblue,
                                  cie_lightgrey,
                                  cie_darkgrey
                                ),
  `new` =
                                c(
                                  cie_yellow,
                                  cie_orange,
                                  cie_darkorange,
                                  cie_red,
                                  cie_darkred,
                                  cie_lightyellow,
                                  cie_blue,
                                  cie_darkblue,
                                  cie_lightgrey,
                                  cie_darkgrey
                                ))



#' Interpolate a CIE colour palette
#'
#' This function takes a CIE colour palette and generates more colours from it,
#' so that there are enough to make your chart.
#'
#' The interpolation method is set to "spline" (the default is "linear") in an
#' attempt to reduce the number of vomit colours that get produced when
#' generating many colours.
#'
#' It returns a function that takes a single value and makes that many colours.
#'
#' @param palette (character; default = \code{"graph"}) given name of a CIE
#'   palette: \code{\link{cie_palettes}}
#' @param reverse (boolean; default = \code{FALSE}) indicating if palette should
#'   be reverse
#' @param ... Additional arguments to pass to \code{colorRampPalette} see
#'   details here \code{\link[grDevices]{colorRamp}}
#'
#' @seealso \code{\link{cie_palettes}}
#'
#' @examples
#'
#' ggplot2::ggplot(mtcars, ggplot2::aes(x = mpg, y = hp, colour = as.character(wt))) +
#'   ggplot2::geom_point() +
#'   ggplot2::scale_colour_manual(values = make_cie_pal()(29))
#'
#' @export
make_cie_pal <- function(palette = "sequential",
                             reverse = FALSE,
                             ...) {

  assertthat::assert_that(palette %in% c("graph", "sequential", "diverging"),
                          msg = "Palette isn't one of `graph`, `sequential` or `diverging`")

  pal <- cie_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(
    pal,
    ...,
    interpolate = "spline"
  )
}

#' Create a CIE colour palette
#'
#' This function takes a the CIE graph colour palette and returns a vector of colours equal to n.
#' It is used in \code{\link{scale_colour_cie}} and \code{\link{scale_fill_cie}} to make the discrete
#' colour scale as the order of colours is specific in the CIE branding guides and so using an interpolated scale
#' does not work.
#'
#'
#' @param n how many colours to return
#'
#' @seealso \code{\link{cie_palettes}}
#'
#' @export
make_cie_pal_discrete <- function(n) {
  assertthat::assert_that(n <= 10,
                          msg = "Chart requires more than 10 colours. Consider a continuous palette or make a palette with more colours own using `make_cie_pal(palette = 'graph')` e.g. `scale_colour_manual(values = make_cie_pal(palette = 'graph')(29))")
  pal <- cie_palettes[["graph"]][1:n]

  order_name <- dplyr::if_else(options("cie_palette") == "old", "old", "new")

  order <- palette_order[[order_name]]

  ordered_pal <- order[order %in% pal]

  return(ordered_pal)
}

#' Register the option for which palette to use.
#'
#' CIE now has an old palette and a new palette. Depending which is needed users can
#' set options("cie_palette" = "old") to have the colours map to the old colours. Otherwise the colours
#' default to the new colours.
#'
#' @export
register_palette <- function() {
  palette_option <- options("cie_palette")
  if (is.null(palette_option$cie_palette)) {
    options("cie_palette" = "latest")
  }
}

### Deprecated ####
# nocov start
# Generates a full palette
# deprecated in version 1.0.0
cie_palette <- function(palette = "full", reverse = FALSE, ...) {

  pal <- cietheme::cie_palette_set[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}

#' Create a CIE-appropriate palette for your chart.
#'
#' @param n Numeric. The number of levels in your colour scale. Minimum value is
#'   1, maximum is 10. Using more than 6 is not recommended. If you don't
#'   specify `n`, a five-colour palette will be used, which may not look right.
#'   Specify `n`.
#'
#'   By default, n = 2 will give you light orange and dark orange. Use n = "2a"
#'   if you want light orange and red.
#' @param reverse Logical. FALSE by default. Setting to TRUE reverses the
#'   standard colour order. Standard colour order runs from light to dark. If
#'   you set reverse to TRUE, colours will run from dark to light.
#'
#' @param faded Deprecated - use \code{faded_level}. Logical. FALSE by default. Setting to TRUE returns the faded
#'   variations of the standard colours. If TRUE and \code{faded_level = 0}, sets \code{faded_level} to 5.
#'
#' @param faded_level Integer between 0 (no fade; the default) and 8 (most faded).
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
#'     geom_point() +
#'     theme_cie() +
#'     scale_colour_manual(values = cie_pal(n = 3))
#'
#' p
#'
#' # Alternatively, use cie_colour_manual(), which is a wrapper
#' # around scale_colour_manual():
#'
#' p <- ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
#'     geom_point() +
#'     theme_cie() +
#'     cie_colour_manual(n = 3)
#'
#' p
#'
#' @export

cie_pal <- function(n = 0,
                        reverse = FALSE,
                        faded_level = 0,
                        faded = FALSE) {

  lifecycle::deprecate_warn(when = "1.0.0", what = "cie_pal()",
                            details = "Please use `make_cie_pal` or `make_cie_pal_discrete` instead.")

  if (isTRUE(faded) & faded_level == 0) {
    faded_level <- 4
    warning("faded argument is deprecated. Please use faded_level instead.",
            "Setting faded_level to 4.")
  }

  if (!faded_level %in% c(0:8)) stop("faded_level must be an integer between 0 and 8.")

  if (n == 0) {
    n <- 6
    "Your chart will probably look better if you specify n in cie_pal()."
  }

  if (n > 10 & n != "2a") {
    stop(paste0("You've requested ", n,
                " colours; cie_pal() only supports up to 10."))
  }

  palette <- get_palette(n, faded_level)

  if (isTRUE(reverse)) {
    palette <- rev(palette)
  }

  palette
}

get_palette <- function(n, f) {

  if (n == 1) {
    palette <- "orange"
  } else if (n == "2a") {
    palette <- c("orange",
                         "darkorange")
  } else if (n == 2) {
    palette <- c("orange",
                         "red")
  } else if (n == 3) {
    palette <- c("yellow",
                         "orange",
                         "red")
  } else if (n == 4) {
    palette <- c("yellow",
                         "orange",
                         "darkorange",
                         "red")
  } else if (n == 5) {
    palette <- c("yellow",
                         "orange",
                         "darkorange",
                         "red",
                         "darkred")
  } else if (n == 6) {
    palette <- c("lightyellow",
                              "yellow",
                              "orange",
                              "darkorange",
                              "red",
                              "darkred")
  } else if (n == 7) {
    palette <- c("lightyellow",
                              "yellow",
                              "lightorange",
                              "darkorange",
                              "red",
                              "darkred",
                              "blue")
  } else if (n == 8) {
    palette <- c("lightyellow",
                              "yellow",
                              "lightorange",
                              "darkorange",
                              "red",
                              "darkred",
                              "blue",
                              "darkblue")
  } else if (n == 9) {
    palette <- c("lightyellow",
                              "yellow",
                              "lightorange",
                              "darkorange",
                              "red",
                              "darkred",
                              "blue",
                              "darkblue",
                              "lightgrey")
  } else if (n == 10) {
    palette <- c("lightyellow",
                              "yellow",
                              "lightorange",
                              "darkorange",
                              "red",
                              "darkred",
                              "blue",
                              "darkblue",
                              "lightgrey",
                              "darkgrey")
  }

  if (f == 0) f <- ""

  palette <- purrr::map_chr(
    paste0("cie_", palette, f),
    get
  )

  return(palette)

}
# nocov end


