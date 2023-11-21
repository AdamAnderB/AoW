## ----ET Data: Localizing Visual Stimuli----
#logically equivalent to doing full join and removing non-experimental trials.
all_data <-behavioral_data %>% 
  left_join(et_data, by=c("Participant.Private.ID", "Spreadsheet.Row"))

center=.5#center of screen
distance=0#distance to visual stimuli
beyond_screen=1 #distance to beyond_screen

all_data<-all_data%>%
  mutate(image_viewing=
  case_when(x_pred_normalised <= center-distance & 
              y_pred_normalised >= center+distance ~ image_1,
            x_pred_normalised >= center+distance & 
              y_pred_normalised >= center+distance ~ image_2,
            x_pred_normalised <= center-distance & 
              y_pred_normalised <= center-distance ~ image_3,
            x_pred_normalised >= center+distance & 
              y_pred_normalised <= center-distance ~ image_4))%>%
  filter(!is.na(image_viewing))

all_data<-all_data %>% 
  mutate(target = if_else(image_viewing == img_1_file, 1, 0), 
         comp_1 = if_else(image_viewing == img_2_file, 1, 0), 
         comp_2 = if_else(image_viewing == img_3_file, 1, 0), 
         dist = if_else(image_viewing == img_4_file, 1, 0))%>%
  filter(x_pred_normalised>center-beyond_screen &
           x_pred_normalised<center+beyond_screen&
         y_pred_normalised>center-beyond_screen &
           y_pred_normalised<center+beyond_screen)
