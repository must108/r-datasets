df_num <- 4
df_dem <- 28

confidence_level <- 0.99

f_value <- qf(confidence_level, df_num, df_dem)

print(f_value)

# analysis of a f-distribution given df for num/dem and alpha level