# An application to return result and probability of surviving Titanic
# Based upon traning dataset from Kaggle

library(shiny)

# Define UI for application that applies Titanic ML model to user input
shinyUI(fluidPage(
  
  # Application title
  titlePanel(h3("Titanic Prediction - Machine Learning")),
  
  # Sidebar
  sidebarLayout(position = "left",
    sidebarPanel(
      
       # Inputs
       textInput("name", "Enter your full name", ""),
       selectInput("title", "Select your title", c("Mr." = 0, "Mrs." = 1, "Master." = 2, "Dr." = 3, "Rev." = 4, "Mlle." = 5, "Col." = 6, "Major." = 7, "the." = 8, "Don." = 9, "Capt." = 10, "Mme." = 11, "Lady." = 12, "Sir." = 14, "Ms." = 15, "Miss." = 16)),
       numericInput("age", "Enter your age", min = 0, max = 100, ""),
       radioButtons("gender", "Select your gender", list("Male" = 1, "Female" = 0)),
       radioButtons("class", "Select your passenger class", list("1st Class" = 1, "2nd Class" = 2, "3rd Class" = 3)),
       sliderInput("fare", "Select your fare (£)", min = 0, max = 100, value = 25),
       numericInput("family", "How many others would you travel with? (Skip if you would travel alone)", min = 0, max = 8, value = 0),
       actionButton("submitButton","Submit"),
       
       # Set CSS style
       tags$style("body{background-color:white; color: black}"),
       tags$style("#name{background-color:white}")
       
    ),
    
    # Main panel
    mainPanel(
      tabsetPanel(
        tabPanel("Model",
                 h3("Introduction"),
                 p("The sinking of the RMS Titanic is one of the most infamous shipwrecks in history.  On April 15, 1912, during her maiden voyage, the Titanic sank after colliding with an iceberg, killing 1502 out of 2224 passengers and crew. This sensational tragedy shocked the international community and led to better safety regulations for ships."),
                 p("This app uses machine learning to assess your chances of surviving the famous ship-wreck by forming algorithmic decisions based upon your input and the training dataset from Kaggle."),
                 h3("Prediction"),
                 p("Complete the information in the sidebar and select \'Submit\' to view prediction"),
                 br(),
                 # Call output result variable
                 h4(textOutput("result")),
                 br(),
                 br(),
                 img(src = "https://camo.githubusercontent.com/e1ac079413eb99fe0708f09e48c4103ac95da25a/68747470733a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f342f34662f546974616e69635f7468655f73696e6b696e672e6a7067", style = "display: block; margin-left: auto; margin-right: auto; width: 35%; height: 35%")),
        tabPanel("Structure", verbatimTextOutput("structure")),
        tabPanel("Data", tableOutput("data"))
      )
    )
    
  )
))
