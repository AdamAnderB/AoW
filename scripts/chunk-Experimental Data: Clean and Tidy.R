## ----Experimental Data: Clean and Tidy----
View(experimental_cleaned)
experimental_cleaned <- task_data%>%
  filter(Participant.Private.ID %in% 
           filtered_quest_data$Participant.Private.ID)%>%
  filter(Zone.Type == "response_button_image"|
           Zone.Type == "response_button_text")%>%
  filter(verb_type == "Restricting" |verb_type == "NonRestricting")%>%
  select_if(~sum(!is.na(.)) > 0)

experimental_tidy<-experimental_cleaned%>%
  select(!c(Event.Index:Local.Date, 
            Screen.Number:Zone.Name,
            Reaction.Time:Response.Type))%>%
  pivot_wider(names_from = Zone.Type,values_from = Response)%>%
  mutate(subject_img_file=center_image) #for renamed matching in next step
