# this script contains all package functions and is to be sources if the user opts not to install the guppyDme package but still wants to navigate the code.

##### hablab
# Labels for Habitat
# Returns a key to convert habitat from single letter to word form
# 
hablab <- function(){
  hablab <- c("A" = "inflow", "B" = "beach", "C" = "core", "D" = "swamp", "E" = "run")
  return(hablab)
}

##### score_sexst
# Define sex_stage classes
#
# Splits individuals into classes based on combination of sex and stage (sexual maturity) and creates a vector as long as the dataset provided.
# 
# function arguments:
# data: Dataset where the sex_stage variable should be introduced.
# f_threshold: Numeric value defining what is considered the smallest size/weight at maturity for females. Works together with \code{f_unit}.
# f_unit: Character value determining whether \code{f_threshold} is expressed in weight (\code{"weight"}) or standard lenght (\code{"size"} or \code{"SL"} or \code{"length"}).

score_sexst <- function(data, f_threshold, f_unit){
  
  if(f_unit == "weight"){
    sex_stage <- ifelse((data$sex %in% c("B", "J")) | (data$sex == "F" & data$weight < f_threshold),
                        "I",
                        as.character(data$sex))
  } else if (f_unit %in% c("size", "SL", "length")) {
    
    sex_stage <- ifelse((data$sex %in% c("B", "J")) |     # either already labelled as juvenile
                          
                          ((data$SL) == "<10") |          # or  new recruit
                          
                          (!is.na(as.numeric(data$SL)) &
                             as.numeric(data$SL) < f_threshold & 
                             data$sex == "F"),            # or female smaller than the threshold
                        "I",
                        as.character(data$sex))
  }
  
  return(sex_stage)
  
}

##### score_substrate
# Transforms substrate categories into continuous
# 
# The substrate types defined in the habitat measurements are transfromed into continous values defining the fineness of the substrate in increasing magnitude.
# 
# function arguments:
# substr_vector: A string vector containing the categories to be substituted with numerical values. Combined substrate types should be defined as \code{"type1/type2"}, separated by a "/"
# scores: A vector of equivalences where scores per each substrate type are defined. Default is
#   \item \code{"silt" = 0}
#   \item \code{"sand" = 1}
#   \item \code{"gravel" = 2}
#   \item \code{"pebbles" = 3}
#   \item \code{"rock" = 4}
# }
# conflicts: String defining how conflicts are resolved. If more than one type of substrate are presented, could use the value for the finer type (\code{"fine"}), the coarser (\code{"coarse"}) or a mean between them (\code{"mean"}).

score_substrate <- function(substr_vector, 
                            scores = c("silt" = "0",
                                       "sand" = "1",
                                       "gravel" = "2",
                                       "pebbles" = "3",
                                       "rock" = "4"),
                            conflicts = "mean"){
  
  # creating a matrix via splitting combined substrate types ()
  substr_mat <- str_split_fixed(substr_vector, "/", n=Inf)
  stopifnot(length(substr_vector) == nrow(substr_mat))
  
  # substituting character strings for character number
  substr_mat <- apply(substr_mat, 2, function(x) as.numeric(str_replace_all(x, scores)))
  stopifnot(length(substr_vector) == nrow(substr_mat))
  
  # now calculating scores based on "conflict" rule
  if(conflicts == "mean"){
    scored <- apply(substr_mat, 1, function(x) mean(x, na.rm = T))
    
  } else if (conflicts == "fine") {
    scored <- apply(substr_mat, 1, function(x) min(x, na.rm = T))
    
  } else if (conflicts == "coarse") {
    scored <- apply(substr_mat, 1, function(x) max(x, na.rm = T))
    
  }
  
  # replacing NaN with NA
  scored[is.nan(scored)] <- NA
  
  # checking length
  stopifnot(length(substr_vector) == length(scored))
  
  return(scored)
}



##### in_range
# Check if value fits range
# 
# Returns TRUE or FALSE depending on whether the value falls into the range of a vector
# 
# function arguments
# x: Value or vector of numeric values to be compared to range
# v: Vector of numeric values to test x against.
# ...: Additional arguments to be passed to `min` and `max`
#

in_range <- function(x, v, ...){
  
  stopifnot(is.numeric(x))
  lo <- range(v, ...)[1]
  hi <- range(v, ...)[2]
  
  i <- x >= lo & x <= hi
  
  return(i)
  
}
