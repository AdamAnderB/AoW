## ----ET Data: Clean-Tidy-Filtering with inner_join()----
#combine eye tracking with response and OSF data frames-- with data clean-up and manipulation
et_data<-eyetracking_data%>%
  select(time_elapsed,participant_id,spreadsheet_row,type,x_pred_normalised,y_pred_normalised)%>%
  filter(type =="prediction" )
et_data<-et_data%>%rename("Participant.Private.ID"="participant_id",
                          "Spreadsheet.Row"="spreadsheet_row")
et_data$Participant.Private.ID<-as.factor(et_data$Participant.Private.ID)
