## ----Behavioral Data: Join OSF and Experimental Data----
#combine data and filter out non experimental trials
behavioral_data <- OSF_filt %>% 
  inner_join(experimental_tidy, by=c( "talker","verb_type","subject_img_file"))
