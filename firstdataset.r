# ?ToothGrowth, shows description of dataset #nolint
dataset <- data.frame(ToothGrowth)
print(dataset)

attach(dataset)

# Variance Test
# var.test(response ~ groups, data, alternative = "two.sided") # nolint
var.test(len ~ supp, dataset, alternative = "two.sided")
var.test(len ~ supp, dataset, alternative = "two.sided", conf.level = 0.99)

hist(len)

# H0: variable is normally disributed
# HA: variable is not nornally distributed
# If p-value > .05, the assumption is satisfied

shapiro.test(len)

######### ANOVAS
# results <- aov(len ~ supp, data = dataset) # nolint

results_oneway <- aov(len ~ supp, data = dataset)
summary(results_oneway)

######### Blocking

# results <- aov(response ~ group + block, data = dataset) # nolint

results_block <- aov(len ~ supp + as.factor(dose), data = dataset)
summary(results_block)

######### Two-Way ANOVA
#results <- aov(response ~ group + group2 + group1*group2, data = dataset) # nolint

results_twoway <- aov(len ~ supp + as.factor(dose)
                      + supp * as.factor(dose), data = dataset)
summary(results_twoway)

f_statistic <- ((205.4 + 2425.4 + 108.3) / 5) / 13.2
# ((sum sq of supp + sum sq of as.factor(dose) +
# sum sq of supp:as.factor(dose)) / sum of df) / mean sq of residual

# pf(test statistic, dfnum, dfden, lower.tail = FALSE) # nolint
pf(f_statistic, 5, 54, lower.tail = FALSE)

######### PostHoc

TukeyHSD(results_twoway)
plot(TukeyHSD(results_twoway))

######### Bonf

pairwise.t.test(len, as.factor(dose), method = "bonf")
