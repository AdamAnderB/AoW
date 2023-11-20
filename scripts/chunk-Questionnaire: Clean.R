## ----Questionnaire: Clean----
cleaned_quest_data<-task_data%>%
  filter(display=="questionairre",na.omit=TRUE)%>%
  select(Participant.Private.ID,Screen.Name,Response,Reaction.Time)%>%
  filter(Response != "",Reaction.Time!=0)%>%
  select(!Reaction.Time)
