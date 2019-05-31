# This is the server logic of a Shiny web application.

library(shiny)

# Define server logic required
shinyServer(function(input, output) {
  
  # Create data tab
  df <- read.csv("https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv")
  
  output$data <- renderTable({
    df
  })
  
  # Create structure tab
  output$structure <- renderPrint({
    str(df)
  })
  
  # Create printResults function which fires on actionButton click (#submitButton)
  printResults <- eventReactive(input$submitButton, {
    
    # Inputs
    name <- as.integer(input$name)
    title <- as.integer(input$title)
    age <- as.integer(input$age)
    gender <- as.integer(input$gender)
    class <- as.integer(input$class)
    fare <- as.integer(input$fare)
    family <- as.integer(input$family + 1)
    
    # Create isalone
    if (family == 1) {
      as.integer(isalone <- 1)
    } else {
      as.integer(isalone <- 0)
    }
    
    # Create name length
    namelen <- paste(title, name)
    namelen <- nchar(namelen)
    
    # Model
    library(caret)
    library(randomForest)
    training <- read.csv("train.csv")
    training$Survived <- as.factor(df$Survived)
    
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
    
    inputData <- data.frame(Pclass = class, Sex = gender, Age = age, Fare = fare,
                            FamilySize = family, isAlone = isalone, Title = title,
                            Name_Len = namelen)
    
    print(inputData)
    
    # Prediction and probability
    predict <- predict(rfc, newdata = inputData)
    prob <- predict(rfc, newdata = inputData, type="prob")
    
    # Output
    if (predict == 1) {
      return(paste("You survived with a probability of", prob[2] * 100, "%"))
    } else {
      return(paste("You did not survive with a probability of", prob[1] * 100, "%"))
    }
    
  })
  
  # Create output result variable calling printResults function
  output$result <- renderText({
    printResults()
  })
 
})
