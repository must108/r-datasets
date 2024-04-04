library(readxl)

alum <- read_excel("./q18.xlsx")

df <- data.frame(alum)
print(df)
attach(df)

alum_model <- lm(WLB_Score ~ Hours, data = df)
print(summary(alum_model))
print(anova(alum_model))

