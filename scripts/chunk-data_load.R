## ----data_load----
#set the path to be the folder where the et_data.csv,OSF_data.csv, 
#and task_data.csv are located
path<-"/Users/adambramlett/scripts/the_art_of_wrangling/"
input_path<-file.path(path,"data")
output_path<-file.path(path,"cleaned_data")

#change screens to question in task
task_data<-read.csv(file.path(input_path,"task_data.csv"))
eyetracking_data<-read.csv(file.path(input_path,"et_data.csv"))
OSF_data<-read.csv(file.path(input_path,"OSF_data.csv"))
