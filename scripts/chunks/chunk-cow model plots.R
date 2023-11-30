## ----cow model plots----
glmm1_viz<-glmm1_viz+ggtitle("GLMM Main Model Effects")
glmm2_viz<-glmm2_viz+ggtitle("GLMM Accent Model Effects")
gamm1_viz<-gamm1_viz+ggtitle("GAMM Main Model Effects")
gamm2_viz<-gamm2_viz+ggtitle("GAMM Accent Model Effects")


plot_grid(glmm1_viz, glmm2_viz, nrow = 1, align = "h")
#ggsave(file.path(viz_path,"GLMM_cow_model.pdf"), width = 10, height = 2)
plot_grid(gamm1_viz, gamm2_viz, nrow = 1, align = "h")
#ggsave(file.path(viz_path,"GAMM_cow_model.pdf"), width = 10, height = 2)
