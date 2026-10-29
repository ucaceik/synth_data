##### Meta #####

# Author: Andreas Hoehn
# Version: 1.1 (updated to most recent COMPASS version)
# Date:  2026-08-26
# About: The Main Control File, please ensure you have changed "l_definitions$path_main"
# to reflect your overarching directory

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

### Preparation ###

# clean workspace
rm(list = ls())  # remove all objects from work space 
gc(full = TRUE)  # deep clean garbage
set.seed(1)
setwd("C:/Users/Jamie/Documents/compass")

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

### Libraries ###

# List of Required Packages 
RequiredPackages <- c("data.table", "sf" ,"ggplot2",
                      "jsonlite", "magick", "cowplot","scales")

# ensure all packages are installed and loaded 
.EnsurePackages <- function(packages_vector) {
  new_package <- packages_vector[!(packages_vector %in% 
                                     installed.packages()[, "Package"])]
  if (length(new_package) != 0) {
    install.packages(new_package) }
  sapply(packages_vector, suppressPackageStartupMessages(require),
         character.only = TRUE)
}
.EnsurePackages(RequiredPackages)

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

### Definitions List ###

l_definitions <- list() # definitions 

# geography 
l_definitions$agg_level_EW <- "LSOA21CD"

# general global
l_definitions$scipen          <- 9999
l_definitions$digits          <- 4

# reduce survey -> test purposes only, delete later 
l_definitions$sample         <- FALSE
l_definitions$sample_reduced <- 1000

# synth pop creation 
  # l_definitions$minImprovement <- 0.001 # Not present anymore
  # parameters for 22/09 results
    # l_definitions$synth_pop_run <- 10
    # l_definitions$initialTemp <- 1000            
    # l_definitions$minTemp <- 0.0001
    # l_definitions$coolingRate <- 0.9999          
    # l_definitions$reheatFactor <- 1.0
    # l_definitions$fitnessThreshold <- 0.0001
    # l_definitions$maxIterations <- 500000       
    # l_definitions$windowSize <- 500            
    # l_definitions$change <- 100000
    # l_definitions$distance <- "NORM_EUCLIDEAN"
    # l_definitions$useRandomSeed <- "yes"
    # l_definitions$randomSeed <- seq(1, l_definitions$synth_pop_run, 1)
  # COSINE parameters
    # "initialTemp": 35000.0,
    # "minTemp": 0.000001,
    # "coolingRate": 0.99995,
    # "reheatFactor": 2.5,
    # "fitnessThreshold": 0.000001,
    
    # "maxIterations": 15000000,
    # "windowSize": 500,
    # "change": 2000000,
    # "distance": "COSINE",
    # "useRandomSeed": "yes",
    # "randomSeed": 42
  # Active Parameters
    l_definitions$synth_pop_run <- 3
    l_definitions$initialTemp <- 35000.0            
    l_definitions$minTemp <- 0.000001
    l_definitions$coolingRate <- 0.99995          
    l_definitions$reheatFactor <- 2.5
    l_definitions$fitnessThreshold <- 0.000001
    l_definitions$maxIterations <- 15000000       
    l_definitions$windowSize <- 500            
    l_definitions$change <- 2000000
    l_definitions$distance <- "COSINE"
    l_definitions$useRandomSeed <- "yes"
    l_definitions$randomSeed <- 42

l_definitions$path_main        <-  setwd("C:/Users/Jamie/Documents/compass") ### !!! ADD YOUR MAIN PATH HERE !!! ###
l_definitions$path_compass     <- "compass_windows_amd64.exe"

l_definitions$path_constraints <- "data/England/census2021_e_go_10.csv"
l_definitions$path_survey      <- "data/England/us_hh_export_e_go_10.csv"
l_definitions$path_constraints_sim <- "data/England/census2021_e_go_10_sim.csv"
l_definitions$path_survey_sim      <- "data/England/us_hh_export_e_go_10_sim.csv"

l_definitions$path_survey_link <- "data/compleate_artifical_individual_survey.csv"


l_definitions$path_groups       <- "data/England/groups_e_10.csv"
l_definitions$path_groups_sim   <- "data/England/groups_e_10_sim.csv"

l_definitions$path_synth_pop   <- "results_data/synthetic_population_"
l_definitions$path_scatter     <- "results_data/scatter_"
l_definitions$path_parameters  <- "results_data/log_in_"
l_definitions$path_logging     <- "results_data/log_out_"

l_definitions$path_shapefile <- "shape/meropis.shp"

# visuals
l_definitions$fig_width  <- 25  
l_definitions$fig_height <- 15  
l_definitions$sep_cols   <-  c("#a64701","#f18a3a","#1b9e77")
l_definitions$sep_cols2   <- c("blue","white","red")
l_definitions$sep_alpha  <- 0.05
l_definitions$dot_alpha  <- 0.75
l_definitions$dot_size   <- 2.0
l_definitions$supp_col   <- c("#000000")
l_definitions$fit_col    <- c("red")

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

### Source Code ###

# apply options for seed and download timeout
options(scipen  = l_definitions$scipen,
        timeout = l_definitions$timeout)

# Benchmark Run Time: START #
l_definitions$benchmark_time <- list() 
l_definitions$benchmark_time$start <- Sys.time()

# stages: always run
source("code/01_user_functions.R")
# source("code/02_create_synth_pop.R") # A real guy makes their own compass
# source("code/03_validate_synth_pop.R")
# source("code/04_spatial_plotting.R")

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

### Finish Benchmarking ###

# Benchmark Run Time: END #
# l_definitions$benchmark_time$end <- Sys.time()
# l_definitions$benchmark_time$end - l_definitions$benchmark_time$start

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

l_definitions$path_constraints
