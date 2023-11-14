## ----Questionnaire: Filtered----
#filtered data
filtered_quest_data<-tidy_quest_data%>%
  filter(age<=40 & age>=18 #1 removed due to being outside of age range
         chinese_study_duration==0 & #none removed 
         speaks_L2==0,#2 participants removed that speak other languages
         language_disorder == "No") #none removed
