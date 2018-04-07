rankall <- function(outcome, num = "best") {
  ## Read outcome data
  my_data <- read.csv("outcome-of-care-measures.csv",stringsAsFactors = FALSE,na.strings="Not Available")
  outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23) 
  
  data2 <- na.omit(my_data[,c(2,7,outcomes[outcome])])
  ob_num <- nrow(data2)
  
  ## Check that num and outcome are valid
  if (!(outcome %in% c("heart attack","heart failure","pneumonia"))) 
  {print("invalid outcome")
    stop()}
  
  ## For each state, find the hospital of the given rank

  ranked_hp <- data2[order(data2[,2],data2[,3],data2[,1]),]
  pre_stt <- split(ranked_hp,ranked_hp[,2])#split the data into states
  #Now I have different lists divided by state and in good order

  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  result=data.frame()
  if (num=="best") {
    stt <- lapply(pre_stt,function(e) e[1,c(1,2)])
    for (i in seq_len(length(stt))) {
        result <- rbind(result,stt[[i]][1,]) 
    }
  }
  else if (num=="worst") {
    for (i in seq_len(length(pre_stt))) {
      wst<- nrow(pre_stt[[i]])
      result <- rbind(result,pre_stt[[i]][wst,]) 
    }
  }
  else {
    stt <- lapply(pre_stt,function(e) e[1:num,c(1,2)])
    for (j in seq_len(num)) {
      for (i in seq_len(length(stt))) {
        result <- rbind(result,stt[[i]][j,]) 
      }
    }
  }
  
  #hp_names<-lapply(stt, function(etl) etl[1:num,1])
  #lapply(stt, function(etl) names(stt[1:num],1) <- j)
  #lapply(stt,function(ee) names(ee) <- stt[,2])
  
  result
} 

head(rankall("heart attack", 20), 10)
tail(rankall("heart failure"), 10)