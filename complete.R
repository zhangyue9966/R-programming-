complete<- function(directory,id=1:332) {
  data_list<-list.files(directory, full.names=TRUE)
  ## [1] "specdata/001.csv" "specdata/010.csv" "specdata/100.csv"
  asw<- data.frame()
  for (i in id) {
    data<-read.csv(data_list[i])
    nobs<-sum(complete.cases(data))
    aa<- data.frame(i,nobs)
    asw<- rbind(asw,aa)
  } 
  colnames(asw) <- c("id", "nobs")
  asw
}
#source("complete.R")
#complete("specdata", id=c(2, 4, 8, 10, 12))
