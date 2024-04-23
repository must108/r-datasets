library(readxl)

teeth <- read_excel("./ToothGrowth.xlsx")

dataset <- data.frame(teeth)
print(dataset)
attach(dataset)

####################

# question 1 for mini project

# one-way ANOVA to compare tooth length based on dose size.
anova_results <- aov(len ~ factor(dose), data = dataset)
summary(anova_results)

# validate normal assumption
# hist(len) (outputs a histogram of the data) # nolint

# shapiro-wilk test for normality
# H0: data is normally disributed
# Ha: data is not normally distributed
shapiro.test(len)

# non-parametric test (kruskal wallis test)
np_results <- kruskal.test(len ~ factor(dose), data = dataset)
print(np_results)

####################

# Goodness of fit test (question 2)
counts <- c(61, 53, 36)
exp_probs <- c(1 / 3, 1 / 3, 1 / 3) # sums EXACTLY to 1
chisq_results <- chisq.test(counts, p = exp_probs) # runs a chi-squared test

print(chisq_results)
print(chisq_results$expected)

####################

# question 3

death <- matrix(c(135, 310, 205, 55, 155, 140), byrow = TRUE, nrow = 2)

dimnames(death) <- list(c("Smokers", "Nonsmokers"),
                        c("Cancer", "Heart Attack", "Other")) 
# ^make table look pretty
print(death)

ind_results <- chisq.test(death)
print(ind_results)
print(ind_results$expected)
