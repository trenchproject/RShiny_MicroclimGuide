# GRIDMET

# Variables (param_meta$gridmet)
#       common.name   call                                     description                        units
# 1            prcp     pr                            precipitation_amount                           mm
# 2           rhmax   rmax                 daily_maximum_relative_humidity                      Percent
# 3           rhmin   rmin                 daily_minimum_relative_humidity                      Percent
# 4            shum    sph                    daily_mean_specific_humidity                        kg/kg
# 5            srad   srad       daily_mean_shortwave_radiation_at_surface                        W/m^2
# 6        wind_dir     th                       daily_mean_wind_direction Degrees Clockwise from north
# 7            tmin   tmmn                       2m daily_minimum_temperature                         degK
# 8            tmax   tmmx                       2m daily_maximum_temperature                         degK
# 9        wind_vel     vs                           daily_mean_wind_speed                          m/s
# 10     burn_index     bi                      daily_mean_burning_index_g                     Unitless
# 11     fmoist_100  fm100                        dead_fuel_moisture_100hr                      Percent
# 12    fmoist_1000 fm1000                       dead_fuel_moisture_1000hr                      Percent
# 13 energy_release    erc           daily_mean_energy_release_component-g                     Unitless
# 14         palmer   pdsi        daily_mean_palmer_drought_severity_index                     Unitless
# 15    pet_alfalfa    etr daily_mean_reference_evapotranspiration_alfalfa                           mm
# 16      pet_grass    pet   daily_mean_reference_evapotranspiration_grass                           mm
# 17            vpd    vpd               daily_mean_vapor_pressure_deficit                          kPa


# GRIDMET
# Data pre-cached as .Rda files via OPeNDAP (ncdf4 only, no AOI/climateR).
# Variables: tmax, tmin, srad, wind_vel, prcp
# Locations: CO, OR only (HI not covered by GRIDMET).

grabGRID <- function(param, loc, month) {
  path <- paste0("Data/GRIDMET/", param, "_", loc, "_0", month, ".Rda")
  
  if (!file.exists(path)) {
    stop(paste("GRIDMET data not available for:", param, loc, month))
  }
  
  load(path)  # loads object named 'df'
  return(df)
}