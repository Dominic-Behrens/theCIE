# Define CIE colours =======================================================
# TODO(cietheme): replace these base hex values with the official CIE
# brand palette when supplied. Until then, the "new" branch carries the
# upstream grattantheme palette as a placeholder so the package keeps
# working end-to-end. Users can flip back to the older grattantheme
# palette via `options(cie_palette = "old")`.
base_yellow <<- dplyr::if_else(options("cie_palette") == "old", "#FFE07F", "#3E0E39")
base_darkyellow <- dplyr::if_else(options("cie_palette") == "old", "#FFC35A", "#F5B50C")
base_orange <-  dplyr::if_else(options("cie_palette") == "old", "#F68B33", "#EF7900")
base_darkorange <- "#D4582A" #unchanged
base_red <- dplyr::if_else(options("cie_palette") == "old", "#A02226", "#A1253E")
base_darkred <- dplyr::if_else(options("cie_palette") == "old", "#621214", "#611633")
base_blue <- dplyr::if_else(options("cie_palette") == "old", "#A3C7DF", "#6A99C4")
base_darkblue <- dplyr::if_else(options("cie_palette") == "old", "#3E81CE", "#4371A1")

# Yellow light ----
yellow_palette <- grDevices::colorRampPalette(c(base_yellow, "white"))(10)

#' cie_lightyellow
#'
#' @export
#'
cie_lightyellow <- yellow_palette[1]

#' cie_lightyellow1
#'
#' @export
#'
cie_lightyellow1 <- yellow_palette[2]

#' cie_lightyellow2
#'
#' @export
#'
cie_lightyellow2 <- yellow_palette[3]

#' cie_lightyellow3
#'
#' @export
#'
cie_lightyellow3 <- yellow_palette[4]

#' cie_lightyellow4
#'
#' @export
#'
cie_lightyellow4 <- yellow_palette[5]

#' cie_lightyellow5
#'
#' @export
#'
cie_lightyellow5 <- yellow_palette[6]
#' cie_lightyellow6
#'
#' @export
#'
cie_lightyellow6 <- yellow_palette[7]

#' cie_lightyellow7
#'
#' @export
#'
cie_lightyellow7 <- yellow_palette[8]

#' cie_lightyellow8
#'
#' @export
#'
cie_lightyellow8 <- yellow_palette[9]

# Yellow dark ----
darkyellow_palette <- grDevices::colorRampPalette(c(base_darkyellow, "white"))(10)

#' '
#'
#' @export
#'
cie_darkyellow <- darkyellow_palette[1]

#' '
#'
#' @export
#'
cie_darkyellow1 <- darkyellow_palette[2]

#' '
#'
#' @export
#'
cie_darkyellow2 <- darkyellow_palette[3]

#' '
#'
#' @export
#'
cie_darkyellow3 <- darkyellow_palette[4]

#' '
#'
#' @export
#'
cie_darkyellow4 <- darkyellow_palette[5]

#' '
#'
#' @export
#'
cie_darkyellow5 <- darkyellow_palette[6]

#' '
#'
#' @export
#'
cie_darkyellow6 <- darkyellow_palette[7]

#' '
#'
#' @export
#'
cie_darkyellow7 <- darkyellow_palette[8]

#' '
#'
#' @export
#'
cie_darkyellow8 <- darkyellow_palette[9]



#' '
#'
#' @export
#'
cie_yellow <- cie_darkyellow


#' '
#'
#' @export
#'
cie_yellow1 <- cie_darkyellow1


#' '
#'
#' @export
#'
cie_yellow2 <- cie_darkyellow2


#' '
#'
#' @export
#'
cie_yellow3 <- cie_darkyellow3


#' '
#'
#' @export
#'
cie_yellow4 <- cie_darkyellow4


#' '
#'
#' @export
#'
cie_yellow5 <- cie_darkyellow5


#' '
#'
#' @export
#'
cie_yellow6 <- cie_darkyellow6


#' '
#'
#' @export
#'
cie_yellow7 <- cie_darkyellow7


#' '
#'
#' @export
#'
cie_yellow8 <- cie_darkyellow8


# Orange light ----------
orange_palette <- grDevices::colorRampPalette(c(base_orange, "white"))(10)

#' '
#'
#' @export
#'
cie_lightorange <- orange_palette[1]

#' '
#'
#' @export
#'
cie_lightorange1 <- orange_palette[2]

#' '
#'
#' @export
#'
cie_lightorange2 <- orange_palette[3]

#' '
#'
#' @export
#'
cie_lightorange3 <- orange_palette[4]

#' '
#'
#' @export
#'
cie_lightorange4 <- orange_palette[5]

#' '
#'
#' @export
#'
cie_lightorange5 <- orange_palette[6]

#' '
#'
#' @export
#'
cie_lightorange6 <- orange_palette[7]

#' '
#'
#' @export
#'
cie_lightorange7 <- orange_palette[8]

#' '
#'
#' @export
#'
cie_lightorange8 <- orange_palette[9]


#' '
#'
#' @export
#'
cie_orange <- cie_lightorange

#' '
#'
#' @export
#'
cie_orange1 <- cie_lightorange1

#' '
#'
#' @export
#'
cie_orange2 <- cie_lightorange2

#' '
#'
#' @export
#'
cie_orange3 <- cie_lightorange3

#' '
#'
#' @export
#'
cie_orange4 <- cie_lightorange4

#' '
#'
#' @export
#'
cie_orange5 <- cie_lightorange5

#' '
#'
#' @export
#'
cie_orange6 <- cie_lightorange6

#' '
#'
#' @export
#'
cie_orange7 <- cie_lightorange7

#' '
#'
#' @export
#'
cie_orange8 <- cie_lightorange8


# dark:
darkorange_palette <- grDevices::colorRampPalette(c(base_darkorange, "white"))(10)


#' '
#'
#' @export
#'
cie_darkorange <- darkorange_palette[1]


#' '
#'
#' @export
#'
cie_darkorange1 <- darkorange_palette[2]


#' '
#'
#' @export
#'
cie_darkorange2 <- darkorange_palette[3]


#' '
#'
#' @export
#'
cie_darkorange3 <- darkorange_palette[4]


#' '
#'
#' @export
#'
cie_darkorange4 <- darkorange_palette[5]


#' '
#'
#' @export
#'
cie_darkorange5 <- darkorange_palette[6]


#' '
#'
#' @export
#'
cie_darkorange6 <- darkorange_palette[7]


#' '
#'
#' @export
#'
cie_darkorange7 <- darkorange_palette[8]


#' '
#'
#' @export
#'
cie_darkorange8 <- darkorange_palette[9]



# Red --------------
# light:
red_palette <- grDevices::colorRampPalette(c(base_red, "white"))(10)


#' '
#'
#' @export
#'
cie_lightred <- red_palette[1]


#' '
#'
#' @export
#'
cie_lightred1 <- red_palette[2]


#' '
#'
#' @export
#'
cie_lightred2 <- red_palette[3]


#' '
#'
#' @export
#'
cie_lightred3 <- red_palette[4]


#' '
#'
#' @export
#'
cie_lightred4 <- red_palette[5]


#' '
#'
#' @export
#'
cie_lightred5 <- red_palette[6]


#' '
#'
#' @export
#'
cie_lightred6 <- red_palette[7]


#' '
#'
#' @export
#'
cie_lightred7 <- red_palette[8]


#' '
#'
#' @export
#'
cie_lightred8 <- red_palette[9]



#' '
#'
#' @export
#'
cie_red <- cie_lightred


#' '
#'
#' @export
#'
cie_red1 <- cie_lightred1


#' '
#'
#' @export
#'
cie_red2 <- cie_lightred2


#' '
#'
#' @export
#'
cie_red3 <- cie_lightred3


#' '
#'
#' @export
#'
cie_red4 <- cie_lightred4


#' '
#'
#' @export
#'
cie_red5 <- cie_lightred5


#' '
#'
#' @export
#'
cie_red6 <- cie_lightred6


#' '
#'
#' @export
#'
cie_red7 <- cie_lightred7


#' '
#'
#' @export
#'
cie_red8 <- cie_lightred8



# dark:
darkred_palette <- grDevices::colorRampPalette(c(base_darkred, "white"))(10)


#' '
#'
#' @export
#'
cie_darkred <- darkred_palette[1]


#' '
#'
#' @export
#'
cie_darkred1 <- darkred_palette[2]


#' '
#'
#' @export
#'
cie_darkred2 <- darkred_palette[3]


#' '
#'
#' @export
#'
cie_darkred3 <- darkred_palette[4]


#' '
#'
#' @export
#'
cie_darkred4 <- darkred_palette[5]


#' '
#'
#' @export
#'
cie_darkred5 <- darkred_palette[6]


#' '
#'
#' @export
#'
cie_darkred6 <- darkred_palette[7]

#' '
#'
#' @export
#'
cie_darkred7 <- darkred_palette[8]

#' '
#'
#' @export
#'
cie_darkred8 <- darkred_palette[9]

# Blue -------------------------------------------------------------------------
# light:
blue_palette <- grDevices::colorRampPalette(c(base_blue, "white"))(10)


#' '
#'
#' @export
#'
cie_lightblue <- blue_palette[1]


#' '
#'
#' @export
#'
cie_lightblue1 <- blue_palette[2]


#' '
#'
#' @export
#'
cie_lightblue2 <- blue_palette[3]


#' '
#'
#' @export
#'
cie_lightblue3 <- blue_palette[4]


#' '
#'
#' @export
#'
cie_lightblue4 <- blue_palette[5]


#' '
#'
#' @export
#'
cie_lightblue5 <- blue_palette[6]


#' '
#'
#' @export
#'
cie_lightblue6 <- blue_palette[7]


#' '
#'
#' @export
#'
cie_lightblue7 <- blue_palette[8]


#' '
#'
#' @export
#'
cie_lightblue8 <- blue_palette[9]


#' '
#'
#' @export
#'
cie_blue <- cie_lightblue


#' '
#'
#' @export
#'
cie_blue1 <- cie_lightblue1


#' '
#'
#' @export
#'
cie_blue2 <- cie_lightblue2


#' '
#'
#' @export
#'
cie_blue3 <- cie_lightblue3


#' '
#'
#' @export
#'
cie_blue4 <- cie_lightblue4


#' '
#'
#' @export
#'
cie_blue5 <- cie_lightblue5


#' '
#'
#' @export
#'
cie_blue6 <- cie_lightblue6


#' '
#'
#' @export
#'
cie_blue7 <- cie_lightblue7


#' '
#'
#' @export
#'
cie_blue8 <- cie_lightblue8



# dark:
darkblue_palette <- grDevices::colorRampPalette(c(base_darkblue, "white"))(10)

#' '
#'
#' @export
#'
cie_darkblue <- darkblue_palette[1]

#' '
#'
#' @export
#'
cie_darkblue1 <- darkblue_palette[2]

#' '
#'
#' @export
#'
cie_darkblue2 <- darkblue_palette[3]

#' '
#'
#' @export
#'
cie_darkblue3 <- darkblue_palette[4]

#' '
#'
#' @export
#'
cie_darkblue4 <- darkblue_palette[5]

#' '
#'
#' @export
#'
cie_darkblue5 <- darkblue_palette[6]

#' '
#'
#' @export
#'
cie_darkblue6 <- darkblue_palette[7]
#' '
#'
#' @export
#'
cie_darkblue7 <- darkblue_palette[8]

#' '
#'
#' @export
#'
cie_darkblue8 <- darkblue_palette[9]


# black ----

#' '
#'
#' @export
#'
cie_black <- "#000000"

# grey ------

# light

#' '
#'
#' @export
#'
cie_lightgrey <- "#828282"

#' '
#'
#' @export
#'
cie_lightgrey1 <- "#8F8F8F"

#' '
#'
#' @export
#'
cie_lightgrey2 <- "#9B9B9B"

#' '
#'
#' @export
#'
cie_lightgrey3 <- "#A8A8A8"

#' '
#'
#' @export
#'
cie_lightgrey4 <- "#B4B4B4"

#' '
#'
#' @export
#'
cie_lightgrey5 <- "#C1C1C1"

#' '
#'
#' @export
#'
cie_lightgrey6 <- "#CDCDCD"



#' '
#'
#' @export
#'
cie_lightgrey7 <- "#DADADA"

#' '
#'
#' @export
#'
cie_lightgrey8 <- "#E6E6E6"

# dark
#' '
#'
#' @export
#'
cie_darkgrey <- "#575757"

#' '
#'
#' @export
#'
cie_darkgrey1 <- "#686868"

#' '
#'
#' @export
#'
cie_darkgrey2 <- "#797979"

#' '
#'
#' @export
#'
cie_darkgrey3 <- "#898989"

#' '
#'
#' @export
#'
cie_darkgrey4 <- "#9A9A9A"

#' '
#'
#' @export
#'
cie_darkgrey5 <- "#ABABAB"

#' '
#'
#' @export
#'
cie_darkgrey6 <- "#BCBCBC"

#' '
#'
#' @export
#'
cie_darkgrey7 <- "#CDCDCD"

#' '
#'
#' @export
#'
cie_darkgrey8 <- "#DDDDDD"

# Add other specific CIE colours
#' '
#'
#' @export
#'
cie_grey1 <- "#D9D9D9"

#' '
#'
#' @export
#'
cie_grey2 <- "#AEAEAE"

#' '
#'
#' @export
#'
cie_grey3 <- "#828282"

#' '
#'
#' @export
#'
cie_grey4 <- "#575757"

#' '
#'
#' @export
#'
cie_grey5 <- "#2B2B2B"

#' '
#'
#' @export
#'
cie_grey_alpha <- "#E1E3E5"

#' cie_grey_title
#'
#' @export
#'
cie_grey_title <- "#6A737B"

#' cie_gridlinegrey
#'
#' @export
#'
cie_gridlinegrey <- "#C3C7CB"

#' '
#'
#' @export
#'
cie_orange_alpha <- "#FEF0DE"

#' '
#'
#' @export
#'
cie_box <- "#FEF0DE"

# Add legacy items
cie_lightyellow_f <- "#FFE79F"
cie_yellow_f <- "#FFD283"
cie_lightorange_f <- "#F8A866"
cie_orange_f <- "#F8A866"
cie_darkorange_f <- "#DE815F"
cie_red_f <- "#B7595C"
cie_darkred_f <- "#894D4E"


#' A list of CIE colour sets
#'
#' "full": red, dark orange, light orange, yellow, light yellow
#' "full_f": faded version of "full"
#' "light": light orange, yellow, light yellow
#' "dark": red, dark orange, light orange
#' "diverging": red, faded red, white, faded light orange, light orange
#' "grey": grey 1, grey 2, grey 3, grey 4, grey 5
"cie_palette_set"
