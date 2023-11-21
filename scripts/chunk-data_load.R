## ----data_load----
#set the path to be the folder where the et_data.csv,OSF_data.csv, 
#and task_data.csv are located
path<-"/Users/adambramlett/scripts/the_art_of_wrangling/"
input_path<-file.path(path,"data")
output_path<-file.path(path,"cleaned_data")
shiny_path<-file.path(path,"shiny_apps")
viz_path<-file.path(path,"AoW/figures")
