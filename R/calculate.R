#' Calculate summary statistic for multiple samples
#'
#' @param x a tibble. Tibble containing all resampled observations. It must have a column called "sample_id"
#' @param column a string. The name of the reponse column.
#' @param stat a string. Specifies what type of summary statistic is to be calculated. For now, only mean is available.
#' @return Tibble containing the summarized data, one row for each resampled group (n_samples specified in generate)
#' @export
#'
#' @examples
#' library(dplyr)
#' mtcars %>%
#' specify(response = "hp") %>%
#' generate(n_samples = 10,type = "bootstrap") %>%
#' calculate(column = "hp",stat="mean")

calculate <- function(x,column,stat="mean"){

  ##Check if input is dataframe/tibble

  if(is.data.frame(x)==FALSE){
    stop("Type Error: Data must be a dataframe")
  }

  ##Check if someone sets stat right

  if(!(stat=="mean")){
    stop("Only the mean method for stat has been implemented")
  }

  ##Check if someone sets column

  if(is.character(column)==FALSE){
    stop("You need to set column. the input of column should be a string and it is the name of the response column")
  }
   # `%>%` <- magrittr::`%>%`
  # quo_col_var <- enquo(column)

  x <- x %>%
    dplyr::group_by(sample_id) %>%
    dplyr::summarize_at(column, mean)

  return(x)

}


