## ----eval = FALSE----
## #this chunk of code was created for the purposes of make the shiny app in
## #a seperate script. Can be ignored if you are only interested in the analysis
## shinny_binning_data<-behavioral_data %>%
##   left_join(et_data, by=c("Participant.Private.ID", "Spreadsheet.Row"))
## shinny_binning_data <- apply(shinny_binning_data,2,as.character)
## #write.csv(shinny_binning_data,file.path(shiny_path,"Frame_Rate_App/shiny_binning_data.csv"))
## #write.csv(shinny_binning_data,file.path(shiny_path,"Eye_Fixations_App/shiny_binning_data.csv"))
