## ----GAMM: Accent model output as data for Visualization----
gamm2_effects <- as.data.frame(summary(mod2)$p.table)
gamm2_effects$effect<-as.factor(rownames(gamm2_effects))
gamm2_effects$effect <- fct_rev(fct_inorder(gamm2_effects$effect))
gamm2_effects <- gamm2_effects %>%
  mutate(significance = case_when(
    `Pr(>|z|)` <= 0.001 ~ "***",
    `Pr(>|z|)` <= 0.01 ~ "**",
    `Pr(>|z|)` <= 0.05 ~ "*",
    `Pr(>|z|)` > 0.05 ~ "",))%>%
  mutate(filler = case_when(
    Estimate <= 0.0 ~ -1,
    Estimate >= 0.0 ~ 1))

labels_list2 <- rev(model2_effects$effect)
gamm2_viz<-gamm2_effects%>%ggplot(aes(x=Estimate,y=effect,color=as.factor(filler)))+
  geom_pointrange(aes(xmin = Estimate-1.96 * `Std. Error`, xmax = Estimate+1.96 * `Std. Error`))+
  geom_vline(xintercept = 0, linetype = "dashed", color = "black")+
  geom_text(aes(x=-2,label = significance))+
  theme_minimal()+
  ylab("")+
  scale_y_discrete(labels = labels_list2)+
  theme(panel.grid.minor.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        legend.position = "none")+
  scale_color_manual(values=c("#007BC0", "#FDB515"))
