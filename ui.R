library(shiny)

# Define UI for slider demo application
shinyUI(fluidPage(
 
 # 1. Application title
 titlePanel("HORSE RACE PREDICTION"),
 
 hr(),

  # 3. Columns
 fluidRow(
  
   h4("1. UPCOMING RACE"),
   h5("Enter the distance and track conditions of the race to be predicted."), 
   br(),
   
   column(width=2,offset=0, wellPanel(
   sliderInput(inputId="distance", label="Race distance (m)", min=1000, max=2000, value=1000, step = 100)),  
   selectInput(inputId="going", label="Track conditions", choices = c("Fast 1" = 1,"Good 2" = 2,"Good 3" = 3,"Dead 4" = 4, "Dead 5" = 5, "Slow 6" = 6, "Slow 7" = 7, "Heavy 8" = 8, "Heavy 9" = 9, "Heavy 10" = 10), selected = 4, selectize=FALSE)),    
       
   column(width=7,offset=2, mainPanel(tableOutput("values")))
   ),
 
 hr(),
 fluidRow(
  br(),
   
   h4("2. HORSE DATA"),
   h5("Enter the names and weights of each horse in the upcoming race and information about their last race. Then observe the table of predictions above."), 
  br(),
   
   #HORSE A
   column(width=2,offset=0, wellPanel(
    textInput(inputId="horse_A", label="Name of horse", value="Horse A"),
    h4("Upcoming race"),
    sliderInput(inputId="weight_A", label="Weight (kg)", min = 50, max = 70, value = 60,step=0.5),
    br(),
    h4("Last race"), 
    sliderInput(inputId="dist_A", label="Race distance (m):", min=1000, max=2000, value=1000, step = 100), 
    selectInput(inputId="going_A", label="Track conditions:",choices = c("Fast 1" = 1,"Good 2" = 2,"Good 3" = 3,"Dead 4" = 4, "Dead 5" = 5, "Slow 6" = 6, "Slow 7" = 7, "Heavy 8" = 8, "Heavy 9" = 9, "Heavy 10" = 10), selected = 4, selectize=FALSE),
    numericInput(inputId="win_time_A", label = "Winning horse's time (s):", min = 45, max = 150, value = 100, step=0.01),
    numericInput(inputId="lengths_A", label = "Lengths behind winning horse (0=won):", min = 0, max = 25, value = 0, step=0.1),
    sliderInput(inputId="weight_last_A", label="Weight (kg)", min = 50, max = 70, value = 60,step=0.5)
    )),
   
   #HORSE B
   column(width=2,offset=0, wellPanel(
    textInput(inputId="horse_B", label="Name of horse", value="Horse B"),
    h4("Upcoming race"),
    sliderInput(inputId="weight_B", label="Weight (kg)", min = 50, max = 70, value = 60,step=0.5),
    br(),
    h4("Last race"), 
    sliderInput(inputId="dist_B", label="Race distance (m):", min=1000, max=2000, value=1000, step = 100), 
    selectInput(inputId="going_B", label="Track conditions:",choices = c("Fast 1" = 1,"Good 2" = 2,"Good 3" = 3,"Dead 4" = 4, "Dead 5" = 5, "Slow 6" = 6, "Slow 7" = 7, "Heavy 8" = 8, "Heavy 9" = 9, "Heavy 10" = 10), selected = 4, selectize=FALSE),
    numericInput(inputId="win_time_B", label = "Winning horse's time (s):", min = 45, max = 150, value = 100,step=0.01),
    numericInput(inputId="lengths_B", label = "Lengths behind winning horse (0=won):", min = 0, max = 25, value = 0, step=0.1),
    sliderInput(inputId="weight_last_B", label="Weight (kg)", min = 50, max = 70, value = 60,step=0.5)
   )),
   
   #HORSE C
   column(width=2,offset=0, wellPanel(
    textInput(inputId="horse_C", label="Name of horse", value="Horse C"),
    h4("Upcoming race"),
    sliderInput(inputId="weight_C", label="Weight (kg)", min = 50, max = 70, value = 60,step=0.5),
    br(),
    h4("Last race"), 
    sliderInput(inputId="dist_C", label="Race distance (m):", min=1000, max=2000, value=1000, step = 100), 
    selectInput(inputId="going_C", label="Track conditions:",choices = c("Fast 1" = 1,"Good 2" = 2,"Good 3" = 3,"Dead 4" = 4, "Dead 5" = 5, "Slow 6" = 6, "Slow 7" = 7, "Heavy 8" = 8, "Heavy 9" = 9, "Heavy 10" = 10), selected = 4, selectize=FALSE),
    numericInput(inputId="win_time_C", label = "Winning horse's time (s):", min = 45, max = 150, value = 100,step=0.01),
    numericInput(inputId="lengths_C", label = "Lengths behind winning horse (0=won):", min = 0, max = 25, value = 0, step=0.1),
    sliderInput(inputId="weight_last_C", label="Weight (kg)", min = 50, max = 70, value = 60,step=0.5)
   )),
   
   #HORSE D
   column(width=2,offset=0, wellPanel(
    textInput(inputId="horse_D", label="Name of horse", value="Horse D"),
    h4("Upcoming race"),
    sliderInput(inputId="weight_D", label="Weight (kg)", min = 50, max = 70, value = 60,step=0.5),
    br(),
    h4("Last race"), 
    sliderInput(inputId="dist_D", label="Race distance (m):", min=1000, max=2000, value=1000, step = 100), 
    selectInput(inputId="going_D", label="Track conditions:",choices = c("Fast 1" = 1,"Good 2" = 2,"Good 3" = 3,"Dead 4" = 4, "Dead 5" = 5, "Slow 6" = 6, "Slow 7" = 7, "Heavy 8" = 8, "Heavy 9" = 9, "Heavy 10" = 10), selected = 4, selectize=FALSE),
    numericInput(inputId="win_time_D", label = "Winning horse's time (s):", min = 45, max = 150, value = 100,step=0.01),
    numericInput(inputId="lengths_D", label = "Lengths behind winning horse (0=won):", min = 0, max = 25, value = 0, step=0.1),
    sliderInput(inputId="weight_last_D", label="Weight (kg)", min = 50, max = 70, value = 60,step=0.5)
   )),
   
   #HORSE E
   column(width=2,offset=0, wellPanel(
    textInput(inputId="horse_E", label="Name of horse", value="Horse E"),
    h4("Upcoming race"),
    sliderInput(inputId="weight_E", label="Weight (kg)", min = 50, max = 70, value = 60,step=0.5),
    br(),
    h4("Last race"), 
    sliderInput(inputId="dist_E", label="Race distance (m):", min=1000, max=2000, value=1000, step = 100), 
    selectInput(inputId="going_E", label="Track conditions:",choices = c("Fast 1" = 1,"Good 2" = 2,"Good 3" = 3,"Dead 4" = 4, "Dead 5" = 5, "Slow 6" = 6, "Slow 7" = 7, "Heavy 8" = 8, "Heavy 9" = 9, "Heavy 10" = 10), selected = 4, selectize=FALSE),
    numericInput(inputId="win_time_E", label = "Winning horse's time (s):", min = 45, max = 150, value = 100,step=0.01),
    numericInput(inputId="lengths_E", label = "Lengths behind winning horse (0=won):", min = 0, max = 25, value = 0, step=0.1),
    sliderInput(inputId="weight_last_E", label="Weight (kg)", min = 50, max = 70, value = 60,step=0.5)
   ))
   )))