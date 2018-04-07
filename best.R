#This function reads the outcome-of-care-measures.csv and returns a character 
#vector with the name of the hospital that has the lowest 30-day mortality for 
#the specified outcome in that state.
#The outcomes can be "Heart attack" or "heart failure" etc.
#Hospitals without the specific data should be excluded from the set of hospitals 
#when deciding the rankings.
best<- function(state,outcome) {
  ##read outcome data
  my_data <- read.csv("outcome-of-care-measures.csv",stringsAsFactors = FALSE,na.strings="Not Available")
  outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23) 

  ##Check that state and outcome are valid
  if (!(state %in% names(table(my_data$State)))) 
  {stop("invalid State") 
  }
  
  if (!(outcome %in% c("heart attack","heart failure","pneumonia"))) 
  {stop("invalid outcome") }
  
  ##Return hospital name in that state with lowest 30-day death rate
  data2<- na.omit(my_data[which(my_data$State==state),c(2,7,outcomes[outcome])])
  hp_name<-data2[order(as.numeric(data2[,3]))[1],1]
  print(hp_name)
  }

#Use the following to test the result

best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")
