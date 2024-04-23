library(readxl)
options(scipen = 999)

water <- read_excel("./q74.xlsx")

dataset <- data.frame(water)
# print(dataset)
attach(dataset)

water_model <- lm(Arsenic ~ Latitude + Longitude + Depth, data = dataset)
print(summary(water_model))
print(anova(water_model))