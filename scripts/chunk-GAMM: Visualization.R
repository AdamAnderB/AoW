## ----GAMM: Visualization----
gamm1_effects <- as.data.frame(summary(mod1)$p.table)
gamm1_effects$Model<-"Main"

#gamm2_effects <- as.data.frame(summary(mod2)$p.table)
#gamm2_effects$Model<-"Accent"
#gamm_effects<-rbind(gamm1_effects,gamm2_effects)
#smooth_significance <- as.data.frame(summary(mod1)$s.table)
gamm1_effects<-gamm1_effects
gamm_effects$effect<-as.factor(rownames(gamm_effects))
gamm_effects$effect <- fct_rev(fct_inorder(gamm_effects$effect))
gamm_effects <- gamm_effects %>%
  mutate(significance = case_when(
    `Pr(>|z|)` <= 0.001 ~ "***",
    `Pr(>|z|)` <= 0.01 ~ "**",
    `Pr(>|z|)` <= 0.05 ~ "*",
    `Pr(>|z|)` > 0.05 ~ "",))%>%
  mutate(filler = case_when(
    Estimate <= 0.0 ~ -1,
    Estimate >= 0.0 ~ 1))
gamm_effects<-na.omit(gamm_effects)
gamm_effects%>%ggplot(aes())+
  geom_pointrange(aes(x=Estimate,y=effect,color=as.factor(filler),xmin = Estimate-1.96 * `Std. Error`, xmax = Estimate+1.96 * `Std. Error`))+
  geom_point(aes(x=Estimate,y=effect,fill=Model),size=3)+
  geom_vline(xintercept = 0, linetype = "dashed", color = "black")+
  geom_text(aes(x=-2,y=effect,label = significance))+
  theme_minimal()+
  theme(panel.grid.minor.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        legend.position = "none")+
  scale_color_manual(values=c("#007BC0", "#FDB515"))
ggsave(file.path(viz_path,"model_gamm_effects.pdf"), width = 6, height = 2)
