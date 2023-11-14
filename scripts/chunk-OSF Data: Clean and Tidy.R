## ----OSF Data: Clean and Tidy----
#combine OSF Data and experimental data
#OSF for target, competitor, distractors
OSF_filt <- OSF_data%>%
  select(talker,verb_type,subject_img_file,type,
         img_1_file, img_2_file, img_3_file, img_4_file, 
         target_obj,pic_verification,object_start)%>% 
  filter(type == "Exp")
