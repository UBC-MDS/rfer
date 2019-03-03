#' Specify the response from datr frame, and predictors (if any)
#'
#' @param x A data frame
#' @param response One column which will be chosen as repsonse
#' @param explanatory The columns to be the explanatory variables
#'
#' @return Dataframe containing one column for response variable and zero or more columns for the explanatory variables. The first column is always the response.

#' @export
#'
#' @examples
#' # select Sepal.Length data from data frame `iris`
#' specify(iris,"Sepal.Length")
#'

specify <- function(x,response,explanatory=NULL){

    if (!is.data.frame(x)){
    stop("TypeError: Input should be a data frame")
  }

  if (is.null(response)==TRUE){
    stop("TypeError: Response missing")
  }

  if (is.character(response)==FALSE){
    stop("TypeError: Response should be of type character")
  }

  col <- c(response)

  # if explantory value added
  if (is.null(explanatory)==FALSE){
    if (is.character(explanatory)==FALSE){
      stop("TypeError: Explantory should be of type character")
    }
    col <- append(response,explanatory)
  }

  df_output <- x[col]

  df_output
}
