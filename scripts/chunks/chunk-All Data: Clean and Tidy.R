## ----All Data: Clean and Tidy----
frame_rate_cut_off<-5
time_binning<-50
all_data_cleaned<-all_data%>%
  group_by(Participant.Private.ID,subject_img_file,verb_type,talker)%>%
  mutate(count = n(),
            max_time = max(time_elapsed),
            frame_rate = count/max_time*1000)%>%
  ungroup()%>%
  group_by(Participant.Private.ID)%>%
  mutate(median_frame_rate = median(frame_rate))%>%
    filter(median_frame_rate>=frame_rate_cut_off)%>%
  mutate(time_elapsed=time_elapsed-object_start-200)%>% 
  mutate(time_elapsed_rounded=time_binning*round((time_elapsed)/time_binning))

all_data_tidy <- all_data_cleaned%>%
  filter(time_elapsed_rounded>=-400 & time_elapsed_rounded<=800)
