pollutantmean<- function(directory,pollutant,id=1:332) {
  data_list<-list.files(directory, full.names=TRUE)[id]
  ## [1] "specdata/001.csv" "specdata/010.csv" "specdata/100.csv"
  dat<- data.frame()
  for (idx in data_list) {
    dat<-rbind(dat,read.csv(idx))
  }
  mean(dat[,pollutant],na.rm=TRUE)
}

#pollutantmean("specdata", "sulfate", 1:10)