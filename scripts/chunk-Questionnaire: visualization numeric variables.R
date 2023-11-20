## ----Questionnaire: visualization numeric variables----
tidy_quest_data%>%
  keep(is.numeric) %>% 
  gather() %>% 
  ggplot(aes(value)) +
    facet_wrap(~ key, scales = "free") +
    geom_histogram()
