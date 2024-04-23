library(readxl)
options(scipen = 999)

gas <- read_excel("./q2.xlsx")

dataset <- data.frame(gas)
print(dataset) # nolint
attach(dataset)

gas_model <- lm(Heat.Rate ~ RPM + CP.Ratio + Inlet.Temp. + Exhaust.Temp.
                + Airflow, data = dataset)
print(summary(gas_model))
print(anova(gas_model))