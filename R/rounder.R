#' Round to the nearest integer
#'
#'Function \code{\link[base]{round}} rounds - by default -  the number `1.5` to
#'integer `2` and the number `2.5` also to integer `2`. The reason for this
#'behaviour is the IEC 60559 standard where a 5 is expected to be rounded to the
#'even digit. This function provides an integer rounding alternative to
#'\code{\link[base]{round}}.
#'
#' @param x A numeric element or vector to round to the nearest integer
#' @returns An integer element or vector
#' @author Gerko Vink \email{g.vink@uu.nl} and Hanne Oberman \email{h.i.oberman@uu.nl}
#' @export
#' @examples
#' library(magrittr)
#' # rounds weirdly
#' c(0.5, 1.5, 2.5, 3.5) %>% round()
#' # rounds correctly
#' c(0.5, 1.5, 2.5, 3.5) %>% rounder()
rounder <- function(x) {
  diff <- x - floor(x)
  out <- x %>% ceiling()
  out[diff < .5] <- floor(x)[diff < .5]
  return(out)
}
