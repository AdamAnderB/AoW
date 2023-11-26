## ----Data Reading----
#select task_data
task_data_select <- file.choose()
task_data<-read.csv(task_data_select,header=TRUE, row.names=1)
#change for ET data
et_data_select<-sub("task_data", "et_data", task_data_select)
eyetracking_data<-read.csv(et_data_select,header=TRUE, row.names=1)
#change for OSF data
OSF_data_select<-sub("task_data", "OSF_data", task_data_select)
OSF_data<-read.csv(OSF_data_select,header=TRUE, row.names=1)
