# Create a machine learning model
library(caret)
library(randomForest)

# Read CSV
df <- read.csv("train.csv")

# Print head
print(head(df))

# View structure
str(df)

# View summary statistics
summary(df)

# Check class imbalance (0 Died vs 1 Survived)
table(df[,"Survived"])

# Convert Survived to binary (factor)
df$Survived <- as.factor(df$Survived)

# Split the data
partition = createDataPartition(df[,"Survived"], times = 1, p = 0.7, list = FALSE)
training = df[partition,] # create the training sample
dim(training)
test = df[-partition,] # create the test sample
dim(test)

# Scale numeric features
preProcValues <- preProcess(training[,2:9], method = c("center", "scale"))

training[,2:9] = predict (preProcValues, training[,2:9])
test[,2:9] = predict(preProcValues, test[,2:9])
head(training[,2:9])

# Random Forest Classifier
features <- Survived ~ Pclass + Sex + Age + Fare + FamilySize + isAlone + Title + Name_Len
rfc = randomForest(features, 
                   data = training,
                   ntree = 500,
                   mtry = 3,
                   nodesize = 0.01,
                   importance = TRUE,
                   proximity = TRUE
                   )

# Print model summary
print(rfc)

# Prediction and Confusion Matrix - train data
p1 <- predict(rfc, training)
confusionMatrix(p1, training$Survived)

# Prediction and Confusion Matrix - test data
p2 <- predict(rfc, test)
confusionMatrix(p2, test$Survived)

# Predict on brand new data
inputData <- data.frame(Pclass = 3, Sex = 0, Age = 30, Fare = 25, FamilySize = 2, 
                         isAlone = 1, Title = 1, Name_Len = 25)

# Scale inputs
inputData = predict(preProcValues, inputData)

# Prediction and probability on inputs
predict <- predict(rfc, newdata = inputData)
prob <- predict(rfc, newdata = inputData, type="prob")
print(predict)
print(prob)




