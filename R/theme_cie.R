#' Create a ggplot2 theme consistent with the CIE style guide.
#' @name theme_cie
#' @param base_size Size for text elements. Defaults to 18, as per the CIE
#'   style guide.
#' @param base_family Font family for text elements. Defaults to "sans".
#' @param chart_type "normal" by detault. Set to "scatter" for scatter plots.
#' @param flipped NULL by default. Set to TRUE if using coord_flip() or creating
#'   horizontal bar charts. If set to TRUE, the theme will show a vertical axis
#'   line, ticks & panel grid, while hiding the horizontals. Ignored for
#'   type = "scatter". When NULL (the default), flipped formatting is
#'   auto-detected when the theme is added to a plot. Set to FALSE explicitly
#'   to override auto-detection.
#' @param background "white" by default. Set to "orange" or "box" if you're
#'   making a chart to go in a CIE report box.
#' @param legend "off" by default. Set to "bottom", "left", "right" or "top" as
#'   desired, or a two element numeric vector such as c(0.9, 0.1).
#' @param panel_borders `FALSE` by default. Set to `TRUE` to enable a black
#'   border around the plotting area.
#' @import ggrepel
#' @import ggplot2
#'
#' @examples
#'
#' # This function goes most of the way to making your charts CIE-y,
#' # but manual tweaking will almost definitely be required
#'
#' # A minimal example:
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = wt, y = mpg)) +
#'     geom_point() +
#'     theme_cie()
#'
#' # To ensure your x-axis is at zero (or some other value you choose),
#' # you may need to manually tweak the scale of the y-axis.
#' # Use scale_y_continuous_cie() for some sensible default values, which
#' # may need further tweaking.
#'
#' ggplot(mtcars, aes(x = wt, y = mpg)) +
#'     geom_point() +
#'     scale_y_continuous_cie() +
#'     theme_cie()
#'
#' # You'll notice in the example above that the top of the chart now looks
#' # good; the bottom has two
#' # points that are half hanging off the axis. Try the following, substituing
#' # any value (incl. 0) for 10 as you like:
#'
#' ggplot(mtcars, aes(x = wt, y = mpg)) +
#'     geom_point() +
#'     scale_y_continuous_cie(limits = c(10, NA)) +
#'     theme_cie()
#'
#' # An example with colours follows. See ?cie_pal for more information and
#' # options.
#'
#' ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
#'     geom_point() +
#'     scale_y_continuous_cie(limits = c(10, NA)) +
#'     scale_colour_manual(values = cie_pal(n = 3)) +
#'     theme_cie()
#'
#' # The legend is off by default. You may wish to turn it on. Here's how:
#'
#' ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
#'     geom_point() +
#'     scale_y_continuous_cie(limits = c(10, NA)) +
#'     scale_colour_manual(values = cie_pal(n = 3)) +
#'     theme_cie(legend = "bottom")
#'
#' # The flipped = TRUE option makes things easier when using coord_flip, as in:
#'
#' ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
#'     geom_point() +
#'     scale_y_continuous_cie(limits = c(10, NA)) +
#'     scale_colour_manual(values = cie_pal(n = 3)) +
#'     theme_cie(flipped = TRUE, legend = "bottom") +
#'     coord_flip()
#'
#'
#' # Making a chart to go in a box? Then you'll want the background = "orange"
#' # option, as in:
#'
#' ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
#'     geom_point() +
#'     scale_y_continuous_cie(limits = c(10, NA)) +
#'     scale_colour_manual(values = cie_pal(n = 3)) +
#'     theme_cie(flipped = TRUE, background = "orange") +
#'     theme(legend.position = "bottom") +
#'     coord_flip()
#'
#'
#' # Want to make a 'self-contained' chart that includes a title/subtitle/caption,
#' # eg. to go on the CIE blog? If so, just add them - they'll be properly
#' # left-aligned when you save them with cie_save(), like this:
#'
#'  ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
#'     geom_point() +
#'     scale_y_continuous_cie(limits = c(10, NA)) +
#'     scale_colour_manual(values = cie_pal(n = 3)) +
#'     theme_cie() +
#'     labs(title = "Title goes here",
#'          subtitle = "Subtitle goes here",
#'          caption = "Notes: Notes go here\nSource: Source goes here")
#'
#'  # Save the plot with:
#'
#'  \dontrun{cie_save("your_file.png")}
#'
#' @export

theme_cie <- function(base_size = 18,
                          base_family = "sans",
                          chart_type = "normal",
                          flipped = NULL,
                          background = "white",
                          legend = "none",
                          panel_borders = FALSE) {

  if (!chart_type %in% c("normal", "scatter")) {
    warning(paste0("Note: chart_type should be 'normal' or 'scatter', but you entered '",
                   chart_type, "'. Reverting to 'normal'"))
    chart_type <- "normal"
  }

  # Resolve NULL → FALSE for building the theme; auto-detection
  # happens later in ggplot_add.cie_theme() when flipped is NULL
  flipped_resolved <- isTRUE(flipped)

  if (chart_type == "normal") {
    ret <- theme_cie_normal(base_size = base_size,
                                base_family = base_family,
                                background = background,
                                legend = legend,
                                panel_borders = panel_borders,
                                flipped = flipped_resolved)
  }

  if (chart_type == "scatter") {
    ret <- theme_cie_scatter(base_size = base_size,
                                 base_family = base_family,
                                 background = background,
                                 legend = legend,
                                 panel_borders = panel_borders)
    if (isTRUE(flipped)) {
      message("Note that the 'flipped' argument is ignored for scatter plots.")
    }
  }

  # Call a function that modifies various geom defaults
  cieify_geom_defaults()

  # Store original arguments (including NULL flipped) for auto-detection
  attr(ret, "cie_args") <- list(
    base_size = base_size,
    base_family = base_family,
    chart_type = chart_type,
    flipped = flipped,
    background = background,
    legend = legend,
    panel_borders = panel_borders
  )
  class(ret) <- c("cie_theme", class(ret))

  return(ret)

}
