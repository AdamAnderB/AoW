## ----Behavioral Data: Join OSF and Experimental Data----
#participant and item removal (grouped) and individual trial removal
#combine data and filter out non experimental trials
behavioral_data <- OSF_filt %>% 
  inner_join(experimental_tidy, by=c( "talker","verb_type","subject_img_file"))
