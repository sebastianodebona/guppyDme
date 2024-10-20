#' Define sex_stage classes
#' 
#' Splits individuals into classes based on combination of sex and stage (sexual maturity) and creates a vector as long as the dataset provided.
#' 
#' @param data Dataset where the \code{sex_stage} variable should be introduced.
#' @param f_threshold Numeric value defining what is considered the smallest size/weight at maturity for females. Works together with \code{f_unit}.
#' @param f_unit Character value determining whether \code{f_threshold} is expressed in weight (\code{"weight"}) or standard lenght (\code{"size"} or \code{"SL"} or \code{"length"}).
#' 
#' @export
#' 

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