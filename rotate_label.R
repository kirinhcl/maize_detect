library(tidyverse)
setwd("~/Downloads/maize/annotation")
temp=list.files(path="~/Downloads/maize/annotation",pattern="*.txt")

for(i in 1:length(temp)){
  file=read.table(temp[i],sep = ' ')
  file1 <- file %>% dplyr::select(V1,V3,V2,V5,V4)
  file1['V2'] <- 1-file1['V2']
  setwd("~/Downloads/maize/annotationnew")
  name=paste(gsub(pattern = ".txt",replacement = "",x=temp[i]),"_rotate.txt",sep="")
  write.table(file1,name,quote=FALSE,col.names=FALSE,row.names=FALSE,sep=' ')
  setwd("~/Downloads/maize/annotation")
}
