# DataFrames 

# Create vectors
name <- c("Anne", "Pete", "Frank", "Julia", "Cath")
age <- c(28, 30, 21, 39, 35)
child <- c(FALSE, TRUE, TRUE, FALSE, TRUE)

# Create dataframe
df <- data.frame(Name = name, Age = age, Child = child)
print(df)
str(df)

# Import csv file
mtcars <- read.csv("https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv", stringsAsFactors = FALSE)

# Preview with head and tail
print(head(mtcars))
print(tail(mtcars))

# Display the structure of the data
print(str(mtcars))

# Next example

name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name, type, diameter, rotation, rings)
print(planets_df)
print(str(planets_df))

# Select diameter of Mercury
planets_df[1, "diameter"] # or planets_df[1,3]

# Select all data for Mars (entire fourth row)
planets_df[4,]

# Select first 5 values of diameter column
planets_df[1:5,"diameter"]

# Shortcut way
rings_vector <- planets_df$rings

# Planets with rings
planets_df[rings_vector,]

# Easier subsetting without any index vector
subset(planets_df, subset = rings)

# Subset planets with diameter < 1
subset(planets_df, subset = diameter < 1)

# Ordering the dataframe smallest to largest planet

# Use order() to create positions
positions <- order(planets_df$diameter) 

# Use positions to sort planets_df
planets_df[positions, ]