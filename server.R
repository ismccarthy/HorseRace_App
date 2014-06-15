library(shiny)

shinyServer(function(input, output) {
 mainfunction <- reactive({
  results <- data.frame(matrix(NA, ncol=3), stringsAsFactors=FALSE, row.names=NULL)
  names(results) <- c("HORSE_NAME","TIME (s)","AVG_SPEED (m/s)")
  
  race_dist <- as.numeric(input$distance)
  race_going <- as.numeric(input$going)
  
  #from an analysis of Australian races for 2013
  beta1 <- 0.070 # coefficient for unit changes in distance
  beta2 <- 1.729 # coefficient for unit changes in track condition
  beta3 <- 0.323 # coefficient for unit changes in weight
  
  A <- c(input$horse_A, input$weight_A, input$dist_A, input$going_A,input$win_time_A, input$lengths_A, input$weight_last_A)
  B <- c(input$horse_B, input$weight_B, input$dist_B, input$going_B,input$win_time_B, input$lengths_B, input$weight_last_B)
  C <- c(input$horse_C, input$weight_C, input$dist_C, input$going_C,input$win_time_C, input$lengths_C, input$weight_last_C)
  D <- c(input$horse_D, input$weight_D, input$dist_D, input$going_D,input$win_time_D, input$lengths_D, input$weight_last_D)
  E <- c(input$horse_E, input$weight_E, input$dist_E, input$going_E,input$win_time_E, input$lengths_E, input$weight_last_E)  
  
  horse_stats <- data.frame(A,B,C,D,E, stringsAsFactors=FALSE)
  
  for (i in horse_stats){  
   horse <- i[1]
   race_weight <- as.numeric(i[2])
   last_dist <- as.numeric(i[3])
   last_going <- as.numeric(i[4])
   last_time <- as.numeric(i[5]) + as.numeric(i[6])/6.0 #win time plus 1/6 second per length
   last_weight <- as.numeric(i[7])
   
   delta_dist <- race_dist - last_dist
   delta_weight <- race_weight - last_weight
   delta_going <- race_going - last_going
   
   predicted_time <- last_time + beta1*delta_dist + beta2*delta_weight + beta3*delta_going 
   results <- rbind(results, c(horse, round(predicted_time,2), round(race_dist/predicted_time,2)))
  }
  
  results <- results [2:6,] #remove initiating row of NAs
  results <- results[order(as.numeric(results$'TIME (s)'), decreasing=FALSE),]
  
  PREDICTION <- c("Winner!!","2nd Place","3rd Place","4th","5th")
  results <- cbind(PREDICTION,results)
   })
 
 output$values <- renderTable({expr=mainfunction()},include.rownames=FALSE)
})