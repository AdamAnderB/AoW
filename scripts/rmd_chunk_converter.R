

#set paths
path<-"/Users/adambramlett/scripts/the_art_of_wrangling/AoW/scripts/"
list<-list.files(path,full.names = TRUE)
list
#removing files
remove_lister<-list.files(path,full.names = TRUE,pattern ="chunk-")
remove_lister
file.remove(remove_lister)

#put in files
library(knitr)
file<-file.path(path,"r_work_flow.Rmd")
p <- purl(file)
read_chunk(p)
chunks <- knitr:::knit_code$get()
invisible(mapply(function(chunk, name) {
  writeLines(c(paste0("## ----",name,"----"), chunk), paste0(path,"chunk-",name,".R"))
}, chunks, names(chunks)))
unlink(p) # delete the original purl script
knitr:::knit_code$restore() 


