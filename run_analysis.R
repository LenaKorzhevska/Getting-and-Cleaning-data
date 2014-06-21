library(plyr)
library(reshape2)
#changing working directory to the folder with data files
setwd("C:/Users/admin/Desktop/Coursera/Getting and Cleaning Data")
setwd("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

WD<-getwd()
#column names for all dataframe
colnames<-read.table("features.txt")
colnames<-as.character(colnames[[2]])
colnames<-c("subjectID",colnames,"activityID")


#load and concatenate files from test folder(without files in subfolders)
setwd("./test/")
filenames<-list.files(pattern = "\\.txt$")
file_t <-sapply(filenames,read.table) 
c_file_t<-do.call("cbind",file_t)
names(c_file_t)<-colnames

#load and concatenate files from train folder(without files in subfolders)
setwd(WD)
setwd("./train/")
filenames<-list.files(pattern = "\\.txt$")
file_train <-sapply(filenames,read.table)
c_file_train<-do.call("cbind",file_train)
names(c_file_train)<-colnames

all_data<-rbind(c_file_t,c_file_train)

#choosing only needed columns with mean() and std() measurements
meas_cols<-grepl(pattern="^subjectID$|(.*)mean\\(\\)(.*)|(.*)std\\(\\)(.*)|^activityID$",x=names(all_data))
all_data_subs<-all_data[,meas_cols]

#join Activity names information to the data
setwd(WD)
act_data<-read.table("activity_labels.txt",col.names=c("activityID","activityLabel"))
final_data<-arrange(join(all_data_subs,act_data),subjectID)
colnames<-names(final_data)

#creating summary data.frame with mean value for each subject for each activity  
data_melt<-melt(final_data,id=colnames[c(1,68,69)],measure.vars=colnames[-c(1,68,69)])
summary_df <- dcast(data_melt, subjectID + activityID+activityLabel~ variable,mean)

#saving tidy data into file
write.table(x=summary_df,file="tidy_data.txt")
