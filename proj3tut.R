library(ISLR)

?College

print(College["University of Central Florida", ])

# S.F.Radio, Outstate, top10perc, PhD

# model <- lm(y ~ x, data = dataset), simple linear regression
# model <- lm(y ~ x1 + x2 + x3 + x4, data = dataset), multiple linear regression

college_model <- lm(Grad.Rate ~ S.F.Ratio + Outstate + Top10perc + PhD,
                    data = College)

print(summary(college_model))
print(anova(college_model))
print(shapiro.test(college_model$residuals))

confint(college_model, level = 0.95)

# predict the graduation rateo f a college with S.F.Ratio = 20
# Outstate = 10000, nolint
# Top10perc = 50%
# PhD = 80%

print(summary(College))
prediction_interval <- predict(college_model, newdata = data.frame(
S.F.Ratio = 20, Outstate = 10000, Top10perc = 50, PhD = 80), #nolint
interval = "confidence", level = 0.95)

print(prediction_interval)