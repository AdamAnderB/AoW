## ----GLMER: Visualizations----
#verb type model viz
model_effects <- as.data.frame(coef(summary(m1_2)))
model_effects$effect<-as.factor(rownames(model_effects))
model_effects$effect <- fct_rev(fct_inorder(model_effects$effect))
model_effects <- model_effects %>%
  mutate(significance = case_when(
    `Pr(>|z|)` <= 0.001 ~ "***",
    `Pr(>|z|)` <= 0.01 ~ "**",
    `Pr(>|z|)` <= 0.05 ~ "*",
    `Pr(>|z|)` > 0.05 ~ "",))%>%
  mutate(filler = case_when(
    Estimate <= 0.0 ~ -1,
    Estimate >= 0.0 ~ 1))

model_effects%>%ggplot(aes(x=Estimate,y=effect,color=as.factor(filler)))+
  geom_pointrange(aes(xmin = Estimate-1.96 * `Std. Error`, xmax = Estimate+1.96 * `Std. Error`))+
  geom_vline(xintercept = 0, linetype = "dashed", color = "black")+
  geom_text(aes(x=-2,label = significance))+
  theme_minimal()+
  ylab("")+
  theme(panel.grid.minor.y = element_blank(),
        legend.position = "none")+
  scale_color_manual(values=c("#007BC0", "#FDB515"))
ggsave(file.path(viz_path,"model_1.pdf"), width = 6, height = 4)

#accent model viz
model2_effects <- as.data.frame(coef(summary(m2)))
model2_effects$effect<-as.factor(rownames(model2_effects))
model2_effects$effect <- fct_rev(fct_inorder(model2_effects$effect))
model2_effects <- model2_effects %>%
  mutate(significance = case_when(
    `Pr(>|z|)` <= 0.001 ~ "***",
    `Pr(>|z|)` <= 0.01 ~ "**",
    `Pr(>|z|)` <= 0.05 ~ "*",
    `Pr(>|z|)` > 0.05 ~ "",))%>%
  mutate(filler = case_when(
    Estimate <= 0.0 ~ -1,
    Estimate >= 0.0 ~ 1))

model2_effects%>%ggplot(aes(x=Estimate,y=effect,color=as.factor(filler)))+
  geom_pointrange(aes(xmin = Estimate-1.96 * `Std. Error`, xmax = Estimate+1.96 * `Std. Error`))+
  geom_vline(xintercept = 0, linetype = "dashed", color = "black")+
  geom_text(aes(x=-2,label = significance))+
  theme_minimal()+
  ylab("")+
  theme(panel.grid.minor.y = element_blank(),
        legend.position = "none")+
  scale_color_manual(values=c("#007BC0", "#FDB515"))
ggsave(file.path(viz_path,"model_1.pdf"), width = 6, height = 4)
