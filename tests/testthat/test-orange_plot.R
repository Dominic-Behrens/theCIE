
context("test that orange/box plots look correct")

base_plot <- mtcars %>%
  ggplot(aes(x = wt,
             y = mpg)) +
  geom_point() +
  labs(title = "Here goes a CIE title, blah blah lots of words go here extremely orange",
       caption = "Notes: Blah Source: somewhere")

orange_plot <- base_plot +
  theme_cie(background = "orange")

box_plot <- base_plot +
  theme_cie(background = "box")

test_that("orange plots work", {
  expect_equal(box_plot, orange_plot)
  expect_identical(box_plot$theme$rect$fill, cie_orange_alpha)
  expect_null(box_plot$theme$panel.background$fill)
})
