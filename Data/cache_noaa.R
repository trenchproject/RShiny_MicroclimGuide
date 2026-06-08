library(httr)
library(jsonlite)

source("R/NOAA NCDC.R")  # loads grabNOAA and station_ids, NOAA_TOKEN

vars     <- c("TMAX", "TMIN", "PRCP", "SNWD")
locs     <- c("OR", "CO", "HI")
months   <- c(1, 7)

cache_dir <- "Data/noaa_cache"
dir.create(cache_dir, showWarnings = FALSE)

for (var in vars) {
  for (loc in locs) {
    for (month in months) {
      fname <- file.path(cache_dir, paste0(var, "_", loc, "_", month, ".rds"))
      if (!file.exists(fname)) {
        message("Fetching: ", var, " | ", loc, " | month ", month)
        Sys.sleep(0.3)  # stay well under rate limit
        tryCatch({
          dat <- grabNOAA(var, loc, month)
          saveRDS(dat, fname)
          message("  Saved: ", fname)
        }, error = function(e) {
          message("  FAILED: ", e$message)
        })
      } else {
        message("  Already cached: ", fname)
      }
    }
  }
}
