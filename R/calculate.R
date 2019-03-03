#' CALCULATE THE MEAN OF THE RESPONSE
#'
#' @param x a tibble. Tibble containing all resampled observations.
#' @param stat a string. Specifies what type of summary statistic is to be calculated. For now, only mean is available. 
#' @param column a string. the column name of the reponse column
#'
#' @return Tibble containing the summarized data, one for each resampled group (n_samples specified in generate)
#' @export
#'
#' @examples
calculate <- function(x,column="response",stat="mean"){

  #Calculate function takes a tibble containing the resampled groups and groups them and calculates a summary statistic for each group
  #For this milestone, we've chosen to go with the mean as the statistic


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
  
  
  `%>%` <- magrittr::`%>%`
  
  x<-x%>%dplyr::group_by(sample_id)%>%dplyr::mutate(stat=mean(x$column))
  
  return(x)
  
  #calculate(mtcars,'cyl',mean)
  
}


