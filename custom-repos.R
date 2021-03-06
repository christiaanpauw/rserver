options(pkgType = "source")

localCRAN <- path.expand("/home/shiny/local-cran")
dir.create(localCRAN)

contribDir <- file.path(localCRAN, "src", "contrib")
dir.create(contribDir, recursive = TRUE)

rVersion <- paste(unlist(getRversion())[1:2], collapse = ".")
binPaths <- list(
  win.binary = file.path("bin/windows/contrib", rVersion),
  mac.binary = file.path("bin/macosx/contrib", rVersion),
  mac.binary.mavericks = file.path("bin/macosx/mavericks/contrib", rVersion),
  mac.binary.leopard = file.path("bin/macosx/leopard/contrib", rVersion)
)

binPaths <- lapply(binPaths, function(x) file.path(localCRAN, x))
lapply(binPaths, function(path) {
  dir.create(path, recursive = TRUE)
})

