library(knitr)

path1<-"/Users/adambramlett/scripts/AOW/AOW_practice/purled_RMD/"
path1
p <- purl("r_work_flow.Rmd")
read_chunk(p)
chunks <- knitr:::knit_code$get()
invisible(mapply(function(chunk, name) {
  writeLines(c(paste0("## ----",name,"----"), chunk), paste0(path,"chunk-",name,".R"))
}, chunks, names(chunks)))
unlink(p) # delete the original purl script
knitr:::knit_code$restore() 


