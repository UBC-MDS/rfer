#' Generate bootstrap and permutation resamples
#'
#' Takes a tibble and generates n samples using either the bootstrapping or permutation methods
#'
#' @param x Tibble or data.frame, containing the response variable from which to sample
#' @param n_samples Integer. The number of samples to be generated. Cannot be negative or 0.
#' @param type String. Specifies the method to regenerate the samples. Default: "bootstrap" (the future implementations will allow for other types including "Permutation")
#'
#' @return Tibble containing all the resamples in a dataframe with an additional column mapping each observation to its sample id.
#' @export
#'
#' @examples
#' library(dplyr)
#' gap_df <- gapminder::gapminder %>%
#'     dplyr::filter(year == 2007 & continent %in% c("Africa"))
#' generate(gap_df, n_samples=5, type="bootstrap")
generate <- function(x,n_samples,type="bootstrap"){

    if (type != "bootstrap") stop("The only resampling method implemented so far is 'bootstrap'")
    if (n_samples <= 0) stop("'n_samples' need to be greater than 0.")

    df_resample <- dplyr::as_tibble(data.frame())

    for (i in 1:n_samples) {
      df_temp <- dplyr::sample_n(x, size=nrow(x), replace=TRUE) %>%
          dplyr::mutate(sample_id = i) %>%
          dplyr::select(sample_id, dplyr::everything())
      df_resample <- dplyr::bind_rows(df_resample, df_temp)
    }

    return(df_resample)
}

