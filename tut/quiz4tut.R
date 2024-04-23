library(readxl)

sample <- read_excel("./linreg1.xlsx")

df <- data.frame(sample)
print(df)
attach(df)

plot(Diameter, Ratio, xlab = "Diameter (mm)", ylab = "Ratio",
     main = "Diameter vs. Ratio Scatterplot")

ratio_model <- lm(Ratio ~ Diameter, data = df)

print(summary(ratio_model))
print(anova(ratio_model))

# y^ = 6.6782 + 0.0048x
# SSE = 0.5374  # nolint: commented_code_linter.

# no practical interpretations of the y-intercept, as no diameter
# of zero was sampled

# for every 1mm increase in pipe diameter, the ratio of repair
# to replacement costs is expected to increase by 0.0048 dollars.

# We expect roughly 95% of observations to lie within 0.442 (2s) of the
# regression line.

# Conduct hypothesis test:data
# Step 0: 4 error assumptions
# Steps 1/2: Ho: B = 0, Ha: B != 0

# Step 3: t = 14.87
# Step 4: p-value = 1.25* 10 ^ -8

# Step 5: At a significance level of 5%, we reject Ho and conclude that there
# is a significant relationship between pipe diameter and cost ratio.

print(confint(ratio_model, level = 0.99))

print(cor(Diameter, Ratio))

# 95.26% of the variation in price ratio can be explained by pipe diameter.
# Can be found under "Multiple R-squared" in summary of model.

plot(ratio_model)

print(shapiro.test(ratio_model$residuals))


