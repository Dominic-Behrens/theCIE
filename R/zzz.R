.onLoad <- function(libname, pkgname) {

  register_palette()
  set_aesthetics("cie")
  setup_cie_fonts()

}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(get_font_status_message())
}
