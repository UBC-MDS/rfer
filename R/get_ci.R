#' Get Confidence Intervals
#'
#' @param data A dataframe/tibble with the calculated statistics in a column named 'stat'
#' @param column A string that specifies the column name in the dataframe that will be used for calculations. Must be specified.
#' @param confidence_level The confidence level specified  as a float between 0 and 1 inclusive. Default is set at 0.95
#' @param point_estimate A value representing a calculated statistic of the original sample. Will be set to "NULL" if method is percentile.
#' @param type A string specifying the type of method to be used to calculate the confidence intervals. Options are "standarderror" or "percentile".
#' As of this version only percentile has been implemented. Default is "percentile".
#'
#' @return 1 x 4 dataframe/tibble with numerical values representing the Confidence Level, Lower Bound, Upper Bound, and Point Estimate
#' @export
#'
#' @examples
#' 
#' df_t <- data.frame(runif(20))
#' names(df_t) <- c("randoms")
#' get_ci(data=df_t,column="randoms",confidence_level=0.9)
#' 
get_ci <- function(data,column=NULL,confidence_level = 0.95,point_estimate=NULL,type="percentile"){
  
  ##Check if input is dataframe/tibble
  
  if(is.data.frame(data)==FALSE){
    stop("Type Error: Data must be a dataframe")
  }
  
  ##Check if column is specified, if not, throw an error that the column needs to be specified, if yes, check if the name is in the dataframe.
  
  if(is.null(column)==TRUE){
    stop("Please specify column with summarized values to calculate confidence intervals")
  }else if(column %in% names(data)){
    colu <- column
  }else{
    stop("Column name specified not in data")
  }
  
  ##Check if someone sets Point Estimate
  
  if(is.null(point_estimate)==TRUE){
    point_estimate <- "N/A"
    #stop("Using the point estimate and standard error to calculate the confidence intervals has not been implemented yet.")
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
    
  lower_upper <- stats::quantile(data[[colu]],c((1-confidence_level)/2,(confidence_level+((1-confidence_level)/2))))
    
  output <- tibble::tibble(confidence_level,lower_upper[1],lower_upper[2],point_estimate)
  names(output) <- c("Confidence_Level","Lower_Bound","Upper_Bound","Point_Estimate")
    
  return(output)
  }