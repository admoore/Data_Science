
complete<-function(directory,id){
  
    setwd(directory)
    Ids<-c(id)
    
    #This section removes the file "Completed_Cases" which is the list used to store
    #the number of completed cases in the file.
    
    Complete_Cases<-data.frame()
    
    #This loop downloads the completed cases.
    MyFiles<-list.files()
    
    for (file in MyFiles){
    
      temp<-read.csv(file,header=TRUE)
      
      temp$Complete_Case<-complete.cases(temp)
      MyID<-unique(temp$ID)
      Sum<-sum(temp$Complete_Case==TRUE)
      temp2=data.frame(MyID,Sum)
      names(temp2)<-c("id","nobs")
      Complete_Cases<-rbind(Complete_Cases,temp2)
      names(Complete_Cases)<-c("id","nobs")
    
      Complete_Cases<-data.frame(Complete_Cases[Complete_Cases$id %in% Ids,])
      
      }
    
 return (Complete_Cases)
    
}      
      
#myval<-complete("C:/Coursera/specdata",1:332)
   







