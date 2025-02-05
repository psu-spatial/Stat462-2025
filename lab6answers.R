library(readxl)
library(olsrr)
spiders <- read_excel("~/Desktop/Spiders.xlsx")


# removing a number of hairs from your head. weight is in mg
weighthair <- read_excel("~/Desktop/weight_hair.xlsx")
hairmodel <- lm(weight_loss~number_hairs_removed,data=weighthair)

# days on a milkshake diet. weight is in lb
weightmilk <- read_excel("~/Desktop/weight_diet.xlsx")
milkmodel <- lm(total_weight_loss~days_on_diet,data=weightmilk)

summary(hairmodel)
ols_regress(hairmodel)

-0.1406 + (-0.9702*20)

summary(milkmodel)
ols_regress(milkmodel)
0.113 + ( 0.036  *20)




spiders$Spiders <- as.factor(spiders$Spiders)
spidermodel <- glm(Spiders~GrainSize,family="binomial",data=spiders)
spidermodel

confint(spidermodel)
exp(confint(spidermodel))

confint.default(spidermodel)
exp(confint.default(spidermodel))


predict(spidermodel,newdata=data.frame(GrainSize=0.35))
exp(0.1449185 )

