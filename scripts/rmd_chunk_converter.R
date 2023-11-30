

#set paths
path<-"/Users/xxxusernamexxx/scripts/the_art_of_wrangling/AoW/scripts/"
list<-list.files(path,full.names = TRUE)
list
#removing files
remove_lister<-list.files(path,full.names = TRUE,pattern ="chunk-")
remove_lister
file.remove(remove_lister)

#put in files
library(knitr)
path<-"/Users/xxxusernamexxx/scripts/the_art_of_wrangling/AoW/scripts/"
file<-file.path(path,"AOW_r_work_flow.Rmd")
file
p <- purl(file)
read_chunk(p)
chunks <- knitr:::knit_code$get()
invisible(mapply(function(chunk, name) {
  writeLines(c(paste0("## ----",name,"----"), chunk), paste0(path,"chunks/chunk-",name,".R"))
}, chunks, names(chunks)))
unlink(p) # delete the original purl script
knitr:::knit_code$restore() 

