
corr<-function(directory,threshold){

setwd(directory)

MyFiles<-list.files()

dataFrame<-vector()

for (file in MyFiles){
  
  temp<-read.csv(file,header=TRUE)
  temp$Complete_Case<-complete.cases(temp)
  Complete_Case_sum<-c(sum(temp$Complete_Case==TRUE,na.rm=TRUE))
  temp<-temp[temp$Complete_Case==TRUE,]
  
  if (Complete_Case_sum > threshold){
    
      temp_corr<-cor(temp$sulfate,temp$nitrate)
      dataFrame<-c(dataFrame,temp_corr)
    
  }
}


return (dataFrame)
}



