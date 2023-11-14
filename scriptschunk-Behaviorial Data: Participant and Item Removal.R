## ----Behaviorial Data: Participant and Item Removal----
#participant removal
participant_agg<-behaviorial_data%>%
  group_by(Participant.Private.ID)%>%
  summarize(num_incorrect_image=sum(image_incorrect),
            num_incorrect_text=sum(text_incorrect))%>%
  mutate(mean_image_score = mean(num_incorrect_image),
         sd_image_score = sd(num_incorrect_image),
         mean_text_score = mean(num_incorrect_text),
         sd_text_score = sd(num_incorrect_text))%>%
  filter(num_incorrect_image <= mean_image_score+(sd_image_score*image_participant_threshold) &
         num_incorrect_text <= mean_text_score+(sd_text_score*text_participant_threshold))
#item removal
item_agg<-behaviorial_data%>%
  group_by(center_image)%>%
  summarize(num_incorrect_image=sum(image_incorrect),
            num_incorrect_text=sum(text_incorrect))%>%
  mutate(mean_image_score = mean(num_incorrect_image),
         sd_image_score = sd(num_incorrect_image),
         mean_text_score = mean(num_incorrect_text),
         sd_text_score = sd(num_incorrect_text))%>%
  filter(num_incorrect_image <= mean_image_score+(sd_image_score*image_item_threshold) &
         num_incorrect_text <= mean_text_score+(sd_text_score*text_item_threshold))

individual_removal <-behaviorial_data%>%
  filter(image_incorrect == 0 & text_incorrect == 0)
