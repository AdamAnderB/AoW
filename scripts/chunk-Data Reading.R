## ----Data Reading----
#change screens to question in task
task_data<-read.csv(file.path(input_path,"task_data.csv"),
                    header=TRUE, row.names=1)
eyetracking_data<-read.csv(file.path(input_path,"et_data.csv"),
                           header=TRUE, row.names=1)
OSF_data<-read.csv(file.path(input_path,"OSF_data.csv"),
                   header=TRUE, row.names=1)
