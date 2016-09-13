#Pollutant Mean.

pollutantmean<-function  (directory, pollutant, id) {
  #directory is character lengthen one and is the location of the files.
  #pollutant is the type of pollutant(sulfur or nitrogen)
  #id is the range of observation ids that will be used for the calculation.
  
  setwd(directory)
  
  MyList<-list.files()
  
  if (exists("Combined_Data")){
    
    rm(Combined_Data)
  }
  
  
  for (file in MyList){
    
      if (!exists("Combined_Data")){
      
      Combined_Data<-read.csv(file, header=TRUE, sep=',')
      
      }
    
      else if (exists("Combined_Data")){
      
      temp_data<-read.csv(file, header=TRUE, sep=',')
      
      Combined_Data<-rbind(Combined_Data,temp_data)
      
      rm(temp_data)
      
      }
    
  }
  
   MyData<-subset(Combined_Data,ID %in% (id) )
  
   MyValue<-mean(MyData[,pollutant],na.rm = TRUE )
  
  return(MyValue)
  
}




