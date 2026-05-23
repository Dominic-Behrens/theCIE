# Suppress R CMD check NOTE about internal data objects
utils::globalVariables("vanilla_geom_aesthetics")

#' A vector of geoms
#'
#' A vector of geoms exported from \code{ggplot2} and extension packages. This
#' vector is iterated on to set the default aesthetics for each geom, allowing
#' the CIE colours to be plotted automatically.
#'
#' @format A vector
"all_geoms"


#' A list of plot options reflecting the CIE brand
#'
plot_opts_cie <- list(
  ggplot2.continuous.colour = scale_colour_cie,
  ggplot2.continuous.fill = scale_fill_cie,
  ggplot2.discrete.colour = function() scale_colour_cie(discrete = TRUE),
  ggplot2.discrete.fill = function() scale_fill_cie(discrete = TRUE)
)

#' The vanilla plotting options
#'
#' These options restore the vanilla ggplot2 colours options for the R session.
#'
plot_opts_vanilla <- list(
  ggplot2.continuous.colour = NULL,
  ggplot2.continuous.fill   = NULL,
  ggplot2.discrete.colour   = NULL,
  ggplot2.discrete.fill     = NULL
)



#' Set default geom aesthetics
#'
#' All arguments are passed to \code{ggplot2::update_geom_defaults}, but this
#' function adds a \code{NULL} check.
#'
#' @param geom Name of geom/stat to modify (like "point" or "bin"), or a
#' Geom/Stat object (like GeomPoint or StatBin).
#' @inheritParams ggplot2::update_geom_defaults
#'
.set_geom_aesthetics <- function(geom, new) {
  if (is.null(new)) {
    return(NULL)
  } else {
    ggplot2::update_geom_defaults(
      geom = geom,
      new = new
    )
  }
}

.safe_set_geom_aesthetics <- purrr::safely(.set_geom_aesthetics) # nolint

#' Prepare \code{ggplot2} geom_ defaults
#'
#' ggplot2 geoms have default aesthetics which can be changed for each
#' session. This function is a generalised way to set geom defaults. It only
#' changes settings where the default is not NA; no need for \code{geom_point}
#' to have a default font family.
#'
#' This is used inside `.set_cie_aesthetics()`
#'
#' @param geom (character) the geom to change (e.g. \code{point} or
#'   \code{line})
#' @param aes (character) the aesthetic to change (e.g. \code{colour} or
#'   \code{alpha})
#' @param setting (various) what to set the aesthetic (e.g. a colour or a
#'   number)
#'
#' @return the default aesthetic ready to be set
.prep_aes <- function(geom, aes, setting) {
  # Check if the geom inherits from elsewhere
  if (is.null(geom)) {
    return(NULL)
  }

  # Check if the setting exists for this geom
  if (is.null(geom[[aes]])) {
    return(geom)
  }

  # Change the setting only if it's not NA
  if (!is.na(geom[[aes]])) {
    geom[[aes]] <- setting
  }

  return(geom)
}


#' Set the default ggplot2 aesthetics to CIE branding
#'
#' A wrapper for a bunch of other functions to set ggplot2 default aesthetics.
#' @importFrom utils getFromNamespace
.set_cie_aesthetics <- function() {

  # Skip this for ggplot2 4.0.0+ as geoms now use from_theme() expressions
  # which properly respect theme settings. The cieify_geom_defaults()
  # function will handle setting appropriate defaults.
  if (utils::packageVersion("ggplot2") >= "4.0.0") {
    return(invisible(NULL))
  }

  # Get Geom objects directly
  get_geom_aes <- function(geom_name) {
    tryCatch({
      geom_class <- paste0("Geom", tools::toTitleCase(geom_name))
      geom_obj <- getFromNamespace(geom_class, "ggplot2")
      if (inherits(geom_obj, "Geom")) {
        return(geom_obj$default_aes)
      }
      NULL
    }, error = function(e) NULL)
  }

  current_aesthetics <- cietheme::all_geoms %>%
    purrr::map(get_geom_aes) %>%
    purrr::set_names(cietheme::all_geoms)

  # Overwrite elements of the current_aesthetics to use theme settings
  # Just font family to inter (if available) and col/fill to QND blue stone
  cie_aesthetics <- current_aesthetics %>%
    # purrr::map(
    #   # We use .prep_aes() (defined above) to handle NULLS and NAs
    #   .prep_aes,
    #   aes = "family",
    #   setting = qnd_font()
    # ) %>%
    purrr::map(
      .prep_aes,
      aes = "colour",
      setting <- cie_orange
    ) %>%
    purrr::map(
      .prep_aes,
      aes = "fill",
      setting <- cie_orange
    )

  # nolint start
  purrr::iwalk(
    cie_aesthetics,
    ~ .safe_set_geom_aesthetics(
      geom = .y,
      new = .x
    )
  )
  # nolint end

  # Explicit setting of geom_sf defaults
  ggplot2::update_geom_defaults(
    geom = "sf",
    new = list(
      col = cie_orange,
      fill = cie_orange
    )
  )
}

#' Set \code{ggplot2} default aesthetics
#'
#' Sets global options for \code{ggplot2}. If \code{type = "cie"}, CIE brand
#' elements (colours and fonts) will be used by default in ggplot. To restore
#' the defaults use \code{type = "vanilla"}.
#'
#' @param type (character) Which aesthetics to use? One of "cie" or "vanilla".
#'
#' @export
#' @examples
#' \dontrun{
#' set_aesthetics(type = "vanilla")
#' }
set_aesthetics <- function(type) {
  nice_type <- ifelse(type == "cie", "cie", type)

  rule <- paste(rep("\u2500", 40), collapse = "")

  the_message <- paste0(
    "\u2500\u2500 Aesthetics ", rule, "\n",
    "ggplot2 will use ", nice_type, " aesthetics (in the absence of a scale_colour etc function).\n",
    "Run `set_aesthetics()` again after any more `library()` calls to ggplot2 extension packages to set the aesthetics of geoms from those packages."
  )


  if (type == "cie") {
    options(plot_opts_cie)
    .set_cie_aesthetics()
    packageStartupMessage(the_message)
  } else if (type == "vanilla") {
    # Set default aesthetics
    options(plot_opts_vanilla)
    purrr::iwalk(
      vanilla_geom_aesthetics,
      ~ .safe_set_geom_aesthetics(
        geom = .y,
        new = .x
      )
    )
    packageStartupMessage(the_message)
  } else {
    message("Not a valid type. Nothing changed.")
  }
}
