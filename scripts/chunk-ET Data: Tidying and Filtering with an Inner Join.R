## ----ET Data: Tidying and Filtering with an Inner Join----
et_data<-eyetracking_data%>%
  select(time_elapsed,participant_id,spreadsheet_row,
         type,x_pred_normalised,y_pred_normalised)%>%
  filter(type =="prediction" )%>%
  rename("Participant.Private.ID"="participant_id",
         "Spreadsheet.Row"="spreadsheet_row")
