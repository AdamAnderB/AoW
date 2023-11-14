## ----unnamed-chunk-1----
all_data <- apply(all_data,2,as.character)
write.csv(target_data,file.path(output_path,"target_data.csv"))
write.csv(all_data,file.path(output_path,"all_data.csv"))
write.csv(agg_data,file.path(output_path,"agg_data.csv"))
