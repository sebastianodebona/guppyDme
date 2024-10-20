#' Labels for Habitat
#' 
#' Returns a key to convert habitat from single letter to word form
#' 
#' @export
#' 
hablab <- function(){
  hablab <- c("A" = "inflow", "B" = "beach", "C" = "core", "D" = "swamp", "E" = "run")
  return(hablab)
}