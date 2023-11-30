## ----OSF Data: Clean and Tidy----
OSF_filt <- OSF_data%>%
  select(talker,verb_type,subject_img_file,img_1_file, img_2_file, 
         img_3_file, img_4_file,log_SUBTLWF_Obj)
