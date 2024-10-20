#' Check if value fits range
#' 
#' Returns TRUE or FALSE depending on whether the value falls into the range of a vector
#' 
#' @export
#' @param x Value or vector of numeric values to be compared to range
#' @param v Vector of numeric values to test x against.
#' @param ... Additional arguments to be passed to `min` and `max`
#'

in_range <- function(x, v, ...){
  
  stopifnot(is.numeric(x))
  lo <- range(v, ...)[1]
  hi <- range(v, ...)[2]
  
  i <- x >= lo & x <= hi
  
  return(i)
  
}
