## ----ET Data: Localizing Visual Stimuli----
all_data <-behaviorial_data %>% inner_join(et_data, by=c("Participant.Private.ID", "Spreadsheet.Row"))

lower=.4
upper=.6

all_data<-all_data%>%
  mutate(image_viewing =  case_when(x_pred_normalised <= lower & y_pred_normalised >= upper ~ image_1,
                                  x_pred_normalised >= upper & y_pred_normalised >= upper ~ image_2,
                                  x_pred_normalised <= lower & y_pred_normalised <= lower ~ image_3,
                                  x_pred_normalised >= upper & y_pred_normalised <= lower ~ image_4))
all_data<-all_data%>%
  filter(image_viewing == image_1|
           image_viewing == image_2|
           image_viewing == image_3|
           image_viewing == image_4)

all_data<-all_data %>% 
  mutate(target = if_else(image_viewing == img_1_file, 1, 0), 
         comp_1 = if_else(image_viewing == img_2_file, 1, 0), 
         comp_2 = if_else(image_viewing == img_3_file, 1, 0), 
         dist = if_else(image_viewing == img_4_file, 1, 0))
