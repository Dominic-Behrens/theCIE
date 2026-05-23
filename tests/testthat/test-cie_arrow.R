test_that("cie_arrow plot appears correct", {

expect_equal(
  cie_arrow(),
  grid::arrow(type = "closed", angle = 20, length = unit(0.5, "lines"))
)

})
