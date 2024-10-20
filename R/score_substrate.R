#' Transforms substrate categories into continuous
#' 
#' The substrate types defined in the habitat measurements are transfromed into continous values defining the fineness of the substrate in increasing magnitude.
#' 
#' @export
#' 
#' @param substr_vector A string vector containing the categories to be substituted with numerical values. Combined substrate types should be defined as \code{"type1/type2"}, separated by a "/"
#' @param scores A vector of equivalences where scores per each substrate type are defined. Default is #' \itemize{
#'   \item \code{"silt" = 0}
#'   \item \code{"sand" = 1}
#'   \item \code{"gravel" = 2}
#'   \item \code{"pebbles" = 3}
#'   \item \code{"rock" = 4}
#' }
#' @param conflicts String defining how conflicts are resolved. If more than one type of substrate are presented, could use the value for the finer type (\code{"fine"}), the coarser (\code{"coarse"}) or a mean between them (\code{"mean"}).

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