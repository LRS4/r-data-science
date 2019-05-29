# R Programming - similar to other languages

# If else
x <- 5
if (x > 3) {
  print("Higher than 3")
} else {
  print("Lower than 3")
}

# For loop - print hello world 10 times
for (i in 1:10) {
  print("Hello, world!")
}

# For loop - iterate through array
array <- c("James","John","Jack")
for (i in 1:length(array)) {
  print(array[i])
}

# Or
for (i in array) {
  print(i)
}

# And
id <- 1
for (i in 1:length(array)) {
  print(paste("Hello", array[i], "your ID is", id))
  id <- id + 1
}

# Function declarations
my_name <- 1

# Declare function to say hello
hello <- function(name) {
  print(paste("Hello", name))
}

# Call function
hello(my_name)
