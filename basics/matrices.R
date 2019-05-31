# Matrix and Matrices (2D Array)

matrix(1:9, nrow=3, byrow=TRUE)

# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

box_office <- c(new_hope, empire_strikes, return_jedi)
star_wars_matrix = matrix(box_office, nrow=3, byrow=TRUE)
print(star_wars_matrix)

# Naming rows and columns

# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Use for naming the matrix
rownames(star_wars_matrix) <- titles
colnames(star_wars_matrix) <- region
print(star_wars_matrix)

# Matrix calculations

# Calculating worldwide box office
worldwide_vector <- rowSums(star_wars_matrix)

# Add worldwide figures as a new column (cbind)
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)
print(all_wars_matrix)

# To add a new row (rbind)
total_revenue_vector <- colSums(star_wars_matrix)
print(total_revenue_vector)

# Subsetting, slicing and indexing

# Select A New Hope - US Box Office
# Row = 1, Column = 1 (Rows first)
star_wars_matrix[1,1]

# Select Return of the Jedi - non US
star_wars_matrix[3,2]

# Select just non-US
non_us_all <- all_wars_matrix[,2]

# Select first two non-US
non_us_all[1:2]

# Mean all vs first two
mean(non_us_all)
mean(non_us_all[1:2])

# Matrices arithmetic

# Estimate visitors by divinding by 5 dollars
visitors <- star_wars_matrix / 5 
print(visitors)
