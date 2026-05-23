context("test CIE label")

set.seed(123)

mt <- mtcars
mt$car <- rownames(mt)

# Create a plot without labels
p <- ggplot(mt, aes(x = mpg, y = wt, label = car)) +
     geom_point() +
     theme_cie()

# A chart with CIE labels
p_label <- p +
    cie_label()

# A chart with CIE labels that are repelled from each other
p_label_repel <- p +
    cie_label_repel(max.overlaps = 10000)

test_that("cie_label plots appear correct", {

  skip_on_ci()

  vdiffr::expect_doppelganger("labelled plot",
                              p_label)

  vdiffr::expect_doppelganger("labelled plot with repel",
                              p_label_repel)
})
