# Factors - Categorical Data

# Create a vector, then encode as a factor (nominal)
sex_vector <- c("Male", "Female", "Female", "Male", "Male")
factor_sex_vector <- factor(sex_vector)
print(factor_sex_vector)

# Identify ordinal data
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, ordered = TRUE, levels = c("Low", "Medium", "High"))
print(factor_temperature_vector)

# How many males in sex factor?
summary(sex_vector)
summary(factor_sex_vector)

# Comparisons only can be used on ordinal data
speed_vector <- c("medium", "slow", "slow", "medium", "fast")
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast"))
print(factor_speed_vector)
summary(factor_speed_vector)

# Is analyst 2 faster than analyst 5?
da2 <- factor_speed_vector[2]
da5 <- factor_speed_vector[5]
da2 > da5