setwd("~/Downloads/maize/annotation")
temp=list.files(path="~/Downloads/maize/annotation",pattern="*.txt")
temp

for(i in 1:length(temp)){
  file=read.table(temp[i],sep = ' ')
  file1 <- file %>% dplyr::select(V1,V3,V2,everything())
  file1['V3'] <- 1-file1['V3']
  setwd("~/Downloads/maize/annotationnew")
  write.table(file1,temp[i],quote=FALSE,col.names=FALSE,row.names=FALSE,sep=' ')
  setwd("~/Downloads/maize/annotation")
}
