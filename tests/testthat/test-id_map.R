context("id_map")

map1 <- id_map("indonesia", "provinsi")

test_that("Class of id_map", {
  expect_equal(class(id_map))
})
