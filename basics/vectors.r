# Vectors - a data structure (array) of the same data type

numeric_vector <- c(1, 10, 49)
character_vector <- c("a", "b", "c")
boolean_vector <- c(TRUE, FALSE, TRUE)

# Assigning names to vectors 

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)
names(roulette_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
print(roulette_vector)

# Another way to assign names
poker_vector <- c(140, -50, 20, -120, 240)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(roulette_vector) <- days_vector
names(poker_vector) <- days_vector
print(roulette_vector)

# Arithmetic with vectors

A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the sum of A_vector and B_vector
total_vector <- A_vector + B_vector
print(total_vector)

# Sum function
total_poker <- sum(poker_vector)
total_roulette <- sum(roulette_vector)
total_week <- total_poker + total_roulette
print(total_week)

# Comparison - is poker higher than roulette
print(total_roulette < total_poker)

# Index of vectors

# Array index starts at 1
# Unlike most other programming languages
poker_wednesday <- poker_vector[3]
print(poker_wednesday)