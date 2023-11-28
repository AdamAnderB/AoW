## ----write all the CSVs for models----
write.csv(model1_effects,file.path(output_path,"GLM_main_model_output.csv"))
write.csv(model2_effects,file.path(output_path,"GLM_accented_model_output.csv"))
write.csv(gamm1_effects,file.path(output_path,"GAM_main_model_output.csv"))
write.csv(gamm2_effects,file.path(output_path,"GAM_accented_model_output.csv"))
