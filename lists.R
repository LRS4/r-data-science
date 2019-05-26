# Lists - storing different data types

# Import csv file
mtcars <- read.csv("https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv", stringsAsFactors = FALSE)

my_vector <- 1:10 
my_matrix <- matrix(1:9, ncol = 3)
my_df <- mtcars[1:10,]

# Create list of above data structures, assign names
my_list <- list(vec = my_vector, mat = my_matrix, df = my_df)
print(my_list)

# Subset second array (list) index, second element (4)
print(my_list$mat[1,2])

# Adding an element to a list using c()
my_list_full <- c(my_list, year = 2019)
print(my_list_full)
print(str(my_list_full))