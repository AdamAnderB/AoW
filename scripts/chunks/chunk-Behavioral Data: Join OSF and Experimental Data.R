## ----Behavioral Data: Join OSF and Experimental Data----
behavioral_data <-experimental_tidy%>%
  left_join(OSF_filt, by=c( "talker","verb_type","subject_img_file"))
