context("test-ng-raw-io.R")

test_that("read_ng_raw works", {
  expect_is(chunks <- read_ng_raw('testdata/read_ng_dump/chunk00789.raw'),
            'ng_raw_list')
  expect_is(chunksh <- read_ng_raw('testdata/read_ng_dump/chunk00789.raw', read_data = FALSE),
            'ng_raw_list')

  expect_equal(chunks[[1]]$h, chunksh[[1]]$h)
  baselineh <-
    list(
      header = as.raw(c(0x28, 0x8f, 0x86, 0x1a, 0x2, 0x0, 0x0, 0x0)),
      filenamelen = 16L,
      blank = 0L,
      name = "000000000003500b",
      lens = c(518L, 986L)
    )
  expect_equal(chunks[[1]]$h, baselineh)

  ff <- dir('testdata/read_ng_dump', pattern='chunk.*\\.raw', full.names = TRUE)
  expect_is(chunksall <- read_ng_raw(ff), 'ng_raw_list')
  expect_equal(names(chunksall[1:2]), names(chunks))
  expect_equal(chunksall[1:2], chunks[1:2])
})
