#' Solve 2d
#'
#' Solves 2d
#'
#' @param X the expression values of input variables
#' @param y the expression values of dependent variables
#' @param x1 the expression values of input variables under condition 1
#' @param x2 the expression values of input variables under condition 2
#' @param lambda1 general network sparity parameter
#' @param lambda2 differential network sparity parameter
#'
#' @return beta (describe beta)
#'
#' @examples
#' # Give an example here that can run independently
#'
#' @export
solve2d <- function(y, x1, x2, lambda1, lambda2) {

  rho1 <- sum(y*x1)
  rho2 <- sum(y*x2)

  area.index <- 0
  beta1 <- 0
  beta2 <- 0

  if (rho2 <= (rho1 + 2*lambda2) && rho2 >= (rho2 - 2*lambda2)
      && rho2 >= (2*lambda1 - rho1)) {
    area.index <- 1
    beta1 <- (rho1 + rho2)/2 - lambda1
    beta2 <- (rho1 + rho2)/2 - lambda1
  }

  if (rho2 > (rho1 + 2*lambda2) && rho1 >= (lambda1 - lambda2)) {
    area.index <- 2
    beta1 <- rho1 - lambda1 + lambda2
    beta2 <- rho2 - lambda1 - lambda2
  }

  if (rho1 < (lambda1 - lambda2) && rho1 >= -(lambda1 + lambda2)
      && rho2 >= (lambda1 + lambda2)) {
    area.index <- 3
    beta1 <- 0
    beta2 <- rho2 - lambda1 - lambda2
  }

  if (rho1 < -(lambda1 + lambda2) && rho2 >= (lambda1 + lambda2)) {
    area.index <- 4
    beta1 <- rho1 + lambda1 + lambda2
    beta2 <- rho2 - lambda1 - lambda2
  }

  if (rho1 < -(lambda1 + lambda2) && rho2 < (lambda1 + lambda2)
      && rho2 >= -(lambda1 - lambda2)) {
    area.index <- 5
    beta1 <- rho1 + lambda1 + lambda2
    beta2 <- 0
  }

  if (rho2 < -(lambda1 - lambda2) && rho2 >= (rho1 + 2*lambda2)) {
    area.index <- 6
    beta1 <- rho1 + lambda1 + lambda2
    beta2 <- rho2 + lambda1 - lambda2
  }

  if (rho2 >= (rho1 - 2*lambda2) && rho2 < (rho1 + 2*lambda2)
      && rho2 <= (-2*lambda1 - rho1)) {
    area.index <- 7
    beta1 <- (rho1 + rho2)/2 + lambda1
    beta2 <- (rho1 + rho2)/2 + lambda1
  }

  if (rho2 < (rho1 - 2*lambda2) && rho1 <= -(lambda1 - lambda2)) {
    area.index <- 8
    beta1 <- rho1 + lambda1 - lambda2
    beta2 <- rho2 + lambda1 + lambda2
  }

  if (rho1 <= (lambda1 + lambda2) && rho1 >= -(lambda1 - lambda2)
      && rho2 <= -(lambda1 + lambda2)) {
    area.index <- 9
    beta1 <- 0
    beta2 <- rho2 + lambda1 + lambda2
  }

  if (rho1 > (lambda1 + lambda2) && rho2 <= -(lambda1 + lambda2)) {
    area.index <- 10
    beta1 <- rho1 - lambda1 - lambda2
    beta2 <- rho2 + lambda1 + lambda2
  }

  if (rho2 > -(lambda1 + lambda2) && rho2 <= (lambda1 - lambda2)
      && rho1 >= (lambda1 + lambda2)) {
    area.index <- 11
    beta1 <- rho1 - lambda1 - lambda2
    beta2 <- 0
  }

  if (rho2 > (lambda1 - lambda2) && rho2 < (rho1 - 2*lambda2)) {
    area.index <- 12
    beta1 <- rho1 - lambda1 - lambda2
    beta2 <- rho2 - lambda1 + lambda2
  }

  beta <- c(beta1, beta2)

  beta

}
