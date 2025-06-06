#' Define n colour hues
#' 
#' Gets n colour hues evenly spaced
#' 
#' @param n Number of used required
#' @export
#' 

gg_color_hue <- function(n) {
  hues = seq(15, 375, length = n + 1)
  hcl(h = hues, l = 65, c = 100)[1:n]
}