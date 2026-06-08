# NOAA NCDC
# Replaces rnoaa::ncdc() with direct CDO REST API calls via httr + jsonlite.
# API docs: https://www.ncei.noaa.gov/cdo-web/webservices/v2

library(httr)
library(jsonlite)

NOAA_TOKEN <- "MpEroBAcjEIOFDbJdJxErtjmbEnLVtbq"

station_ids <- list(
  WA = list(default = "GHCND:USC00454679"),
  CO = list(default = "GHCND:USW00094074", SNWD = "GHCND:US1COWE0345"),
  PR = list(default = "GHCND:RQC00665908"),
  OR = list(default = "GHCND:USC00354291"),
  HI = list(default = "GHCND:USW00021504")
)

grabNOAA <- function(var, loc, month) {
  
  cache_dir  <- "Data/noaa_cache"
  cache_file <- file.path(cache_dir, paste0(var, "_", loc, "_", month, ".rds"))
  
  # Return cached version if available — no API call needed
  if (file.exists(cache_file)) {
    return(readRDS(cache_file))
  }
  
  # Fallback: live API call (only during local dev if cache is missing)
  message("Cache miss — calling NOAA API for: ", var, loc, month)
  Sys.sleep(0.3)
  
  start <- paste0("2017-", sprintf("%02d", as.integer(month)), "-01")
  end   <- paste0("2017-", sprintf("%02d", as.integer(month)), "-31")
  
  if (var == "SNWD" && (month == 7 || loc == "HI")) {
    days <- format(seq(as.Date(start), by = "day", length.out = 31),
                   "%Y-%m-%dT00:00:00")
    result <- data.frame(Date = days, Data = 0)
    saveRDS(result, cache_file)
    return(result)
  }
  
  sid <- if (!is.null(station_ids[[loc]][[var]])) {
    station_ids[[loc]][[var]]
  } else {
    station_ids[[loc]][["default"]]
  }
  
  resp <- GET(
    "https://www.ncei.noaa.gov/cdo-web/api/v2/data",
    add_headers(token = NOAA_TOKEN),
    query = list(
      datasetid  = "GHCND",
      stationid  = sid,
      datatypeid = var,
      startdate  = start,
      enddate    = end,
      limit      = 1000,
      units      = "standard"
    )
  )
  stop_for_status(resp)
  result <- fromJSON(content(resp, "text", encoding = "UTF-8"))$results
  
  # Save to cache for next time
  saveRDS(result, cache_file)
  result
}
