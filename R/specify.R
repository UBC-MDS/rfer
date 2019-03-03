#' Specify the response from datr frame, and predictors (if any)
#'
#' @param df A data frame
#' @param response One column which will be chosen as repsonse
#' @param explanatory The columns to be the explanatory variables
#'
#' @return Dataframe containing one column for response variable and zero or more columns for the explanatory variables. The first column is always the response.

#' @export
#'
#' @examples
#' # select time data from data frame `lung`
#' specify(lung,"time")
#'

specify <- function(x,response,explanatory){
  #Specify function takes a dataframe and a specified response variable column and returns a tibble with all the rows of the specified column

  #Parameters

  # x: Tibble
  #The dataframe that will be manipulated
  # response: string
  #Column name representing the response variable
  # explanatory: string or vector of strings
  #Column names representing the explanatory variables

  #Outputs

  #Tibble containing one column with response variable or many columns with the response as the first column followed by the explanatory variables
  if (!tibble::is.tibble(df)){
    stop("TypeError: Input should be a data frame")
  }

  if (is.data.frame(df)){
    df <- as.tibble(df)
  }

  if (!is.null(response)){
    stop("TypeError: Response missing")
  }

  if (!is.character(response)){
    stop("TypeError: Response should be of type character")
  }

  col <- c(response)

  # if explantory value added
  if (!is.null(explantory)){
    if (!is.character(explantory)){
      stop("TypeError: Response should be of type character")
    }
    col <- append(response,explanatory)
  }

  df_outout <- df[col]

  df_outout
}
