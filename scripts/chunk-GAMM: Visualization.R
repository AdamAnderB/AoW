## ----GAMM: Visualization----
gamm_effects <- as.data.frame(summary(mod1)$p.table)
#smooth_significance <- as.data.frame(summary(mod1)$s.table)

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

gamm_effects%>%ggplot(aes(x=Estimate,y=effect,color=as.factor(filler)))+
  geom_pointrange(aes(xmin = Estimate-1.96 * `Std. Error`, xmax = Estimate+1.96 * `Std. Error`))+
  geom_vline(xintercept = 0, linetype = "dashed", color = "black")+
  geom_text(aes(x=-2,label = significance))+
  theme_minimal()+
  theme(panel.grid.minor.y = element_blank(),
        legend.position = "none")
ggsave(file.path(viz_path,"model_1.pdf"), width = 6, height = 4)
