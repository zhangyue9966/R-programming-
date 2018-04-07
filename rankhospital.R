rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  my_data <- read.csv("outcome-of-care-measures.csv",stringsAsFactors = FALSE,na.strings="Not Available")
  outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23) 
  
  ## Check that state and outcome are valid
  if (!(state %in% names(table(my_data$State)))) 
  {stop("invalid State") 
  }
  
  if (!(outcome %in% c("heart attack","heart failure","pneumonia"))) 
  {stop("invalid outcome") }
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  data2 <- na.omit(my_data[which(my_data$State==state),c(2,7,outcomes[outcome])])
  ob_num <- nrow(data2)#number of observations
  if (num=="best") num<-1
  if (num=="worst") num<-ob_num
  if (num>ob_num) 
    {
    print("NA") 
    stop()
    }
  hp_name<-data2[order(data2[,3],data2[,1])[num],1]
  #use order to sort multiple vectors
  print(hp_name)
}

#test:
#rankhospital("TX", "heart failure", 4)
#rankhospital("MD", "heart attack", "worst")
#rankhospital("MN", "heart attack", 5000)