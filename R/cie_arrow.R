#' Create arrows in the CIE style
#'
#' `cie_arrow()` adds arrows to lines using
#' `grid::arrow()`. The arrows will have a closed arrow head, in keeping with The CIE visual style.
#'
#' @param ... Arguments passed on to either `grid::arrow()`.
#'  See \code{?arrow}.
#' @param length A unit specifying the length of the arrow head (from tip to base). Default 0.5.
#' @param type Arrow head type. Default is "closed".
#' @param angle Angle of arrow head. Default is 20.
#'
#' @examples
#'
#' library(ggplot2)
#'
#' # Create a dataset -- mtcars with rownames as column
#' mt <- mtcars
#' mt$car <- rownames(mt)
#'
#' # Make a basic chart with the mtcars data
#' p <- ggplot(mt, aes(x = mpg, y = wt, label = car)) +
#'  geom_point() +
#'  theme_cie()
#'
#'# Add a simple callout arrow to the chart, using geom_segment, with arrow = cie_arrow()
#'p +
#'geom_segment(aes(x = 15, y = 2, xend = 19.5, yend = 2.74),
#'  arrow = cie_arrow(),
#'  colour = cie_red)
#'
#'# Alternatively we could add a curved arrow, using geom_cuve()
#' p +
#' geom_curve(aes(x = 15, y = 2, xend = 19.5, yend = 2.74),
#'  arrow = cie_arrow(),
#'  curvature = 0.3,
#'  colour = cie_red)
#'
#'
#' @importFrom grid arrow
#' @name cie_arrow
#'
#' @export
#'
cie_arrow <- function(...,
                          type = "closed",
                          angle = 20,
                          length = unit(0.5, "lines")) {
  grid::arrow(...,
              type = type,
              angle = angle,
              length = length
  )
}



