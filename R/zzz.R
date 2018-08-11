.onAttach <- function(libname, pkgname) {
  w <- floor(getOption("width")/1.75)
  t <- " Welcome to nusantr "
  s <- paste(rep("\U1F1EE\U1F1E9", floor((w-nchar(t))/2)), collapse = "")
  bti <- "BhinnekaTunggalIka"
  bti <- unlist(strsplit(bti, ""))
  random_col <- function(x, random = sample(1:9, 1)) {
    switch (random,
      `1` = crayon::black(x),
      `2` = crayon::blue(x),
      `3` = crayon::cyan(x),
      `4` = crayon::green(x),
      `5` = crayon::magenta(x),
      `6` = crayon::red(x),
      `7` = crayon::silver(x),
      `8` = crayon::white(x),
      `9` = crayon::yellow(x)
    )
  }
  for (i in 1:length(bti)) {
    bti[i] <- random_col(bti[i])
  }
  bti <- paste0(bti, collapse = "")
  packageStartupMessage(crayon::red(s), crayon::red(crayon::bold(t)), crayon::red(s))
  packageStartupMessage(crayon::col_align(paste0(crayon::black("#"), bti, collapse = ""),
                                          align = "right"))
  packageStartupMessage(crayon::col_align(crayon::red(paste0("v", utils::packageVersion("nusantr"))),
                                          align = "right"))
}

.onLoad <- function(libname, pkgname) {
  op <- options()
  op.devtools <- list(
    nusantr_gadm_dir = "~/.gadm_map"
  )
  toset <- !(names(op.devtools) %in% names(op))
  if(any(toset)) options(op.devtools[toset])

  # create cache dir if not exists
  if (!dir.exists(getOption("nusantr_gadm_dir"))) {
    dir.create(getOption("nusantr_gadm_dir"), recursive = TRUE)
  }

  invisible()
}

