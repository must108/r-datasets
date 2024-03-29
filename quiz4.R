library(readxl)

data <- read_excel("./STA4163 Quiz 4 Data.xlsx")

df <- data.frame(data)
print(df)
attach(df)

plot(Stat.Theory.1.Grade, Stat.Theory.2.Grade, xlab = "Stats 1 Grade",
ylab = "Stats 2 Grade", main = "Stats 1 vs Stats 2 Scatterplot")

stats_model <- lm(Stat.Theory.2.Grade ~ Stat.Theory.1.Grade, data = df)

print(summary(stats_model))
print(anova(stats_model))