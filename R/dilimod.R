#' Bayesian dili proportional odds model with Stan
#'
#' @export
#' @param standata list containing input data N, P, y, X, sigma_prior, make_pred, N_pred, X_pred
#' @param seedn Seed to use to get reproducible results
#' @param ... Arguments passed to `rstan::sampling` (e.g. iter, chains).
#' @return A list of posterior samples returned by `rstan::extract`
#'

dilimod <- function(standata, seedn = 123, ...) {

  m <- rstan::sampling(stanmodels$ML_model,
                        data = standata,
                        seed = seedn, ...)

  ## extract posterior samples
  post.samp <- rstan::extract(m)

  return(post.samp)

}
