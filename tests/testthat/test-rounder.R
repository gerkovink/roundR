test_that("rounder works", {
  A <- c(0.5, 1.5, 2.5, 3.5) %>% rounder()
  B <- c(0.49, 1.49, 2.49, 3.49) %>% rounder()
  expect_equal(A, c(1, 2, 3, 4))
  expect_equal(B, c(0, 1, 2, 3))
})

test_that("rounder yields different results than round", {
  vec1 <- c(0.5, 1.5, 2.5, 3.5)
  vec2 <- c(0.499999999999999999995,
            1.499999999999999999995,
            2.499999999999999999995,
            3.499999999999999999995)
  A <- vec1 %>% rounder()
  B <- vec1 %>% round()
  C <- vec2 %>% rounder()
  D <- vec2 %>% round()
  expect_false(identical(A, B))
  expect_false(identical(C, D))
})
