#' Get Confidence Intervals
#'
#' @param data A dataframe/tibble with the calculated statistics in a column named 'stat'
#' @param confidence_level The confidence level specified  as a float between 0 and 1 inclusive. Default is set at 0.95
#' @param point_estimate A value representing a calculated statistic of the original sample. Will be set to "NULL" if method is percentile.
#' @param type A string specifying the type of method to be used to calculate the confidence intervals. Options are "standarderror" or "percentile".
#' As of this version only percentile has been implemented. Default is "percentile".
#'
#' @return 1 x 4 dataframe/tibble with numerical values representing the Confidence Level, Lower Bound, Upper Bound, and Point Estimate
#' @export
#'
#' @examples
get_ci <- function(data,confidence_level = 0.95,point_estimate=NULL,type="percentile"){
  
  ##Check if someone sets Point Estimate
  
  if(is.null(point_estimate)==FALSE){
    stop("Using the point estimate and standard error to calculate the confidence intervals has not been implemented yet.")
  }
  
  point_estimate <- "N/A"
  
  ##Check if input is dataframe/tibble
  
  if(is.data.frame(data)==FALSE){
    stop("Type Error: Data must be a dataframe")
  }
  
  ##Check if 'stat' column not present
  
  if(!("stat" %in% names(data))){
    stop("Dataframe must have a column named stat, representing the calculated statistics")
  }
  
  ##Check if something other than "percentile" is input.
  
  if(!(type=="percentile")){
    stop("Only the percentile method for calculating confidence intervals has been implemented")
  }
  
  ##Check if level is numeric
    
  if(is.numeric(confidence_level)==FALSE){
    stop("Value Error: Confidence level must be numeric")
  }
    
  ##Check if level is within range
    
  if(confidence_level>=1 || confidence_level<=0){
    stop("Range Error: Confidence level must be numeric value between 0 and 1. Default is 0.95")
  }
    
  lower_upper <- stats::quantile(data[["stat"]],c((1-confidence_level)/2,(confidence_level+((1-confidence_level)/2))))
    
  output <- tibble::tibble(confidence_level,lower_upper[1],lower_upper[2],point_estimate)
  names(output) <- c("Confidence_Level","Lower_Bound","Upper_Bound","Point_Estimate")
    
  return(output)
  }