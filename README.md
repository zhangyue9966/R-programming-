
# R-programming-
R programming in Coursera

Tips: 

1. Check the discussion forum whenever you meet a problem. Eg: In programming assignment 3,   
my_data <- read.csv("your_data_name",stringsAsFactors = FALSE,na.strings="Not Available")
can help you transform the data forms;

2.In order to get the error message for some invalid input, you can use stop("invalid income");

3.To judge an element in a data set or not : state %in% names(table(my_data$State));

4.Put data in order :   in_order <- data[order(as.numeric(data[,3]))[1],1]

5. If you find the order is wrong (eg 10,12,...,9.8,9.0,...). Check the data, make sure they're numeric other than character.

6. Because the hospital number varies from one to another, the "worst" one (use nrow) can't be decided. You have to use for loop to get a specific state and then find the worst hospital.


It's a great class. The assignments and quiz are awesome. But compared to them, the videos are too simple to cover these topics. 
Good luck to my cleaning data course!
