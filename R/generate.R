generate <- function(x,n_samples,type){
  #Generate takes a tibble and regenerates n samples using either the bootstrapping or permutation methods
  
  #Parameters
  
  # x: tibble 
  #Tibble containing the response variable from which to sample 
  # n_samples: integer 
  #The number of samples to be generated. Cannot be negative or 0.
  # type: string
  #Specifies the method to regenerate the samples. Default: "Bootstrap" (the future implementations will allow for other types including "Permutation")
  
  #Outputs
  
  #tibble containing all the resamples in a dataframe with an additional column mapping each observation to its sample.
  
}