# Assignment 1 Project for Course BAN6420 (Programming in Python and R)

# Task 0 : Use variables to create a list of workers dynamically (at least 400 workers)
# Task 1 : Utilize a for loop to generate payment slips for each of the 400 workers.
# Task 2 : Implement the following conditional statements within the for loop:
    # If the salary is greater than $10,000 and less than $20,000, assign the Employee level as "A1."
    # If the salary is greater than $7,500 and less than $30,000 and the employee is female, set the Employee level as "A5-F."
# Task 3 : Add exception handling to your Python code to address potential errors.
# Task 4 : Convert your Python code into R.
# Task 5 : Package your code into a zipped file and include a README file for submission. Share the zipped file or a link to your GitHub repository.

library(jsonlite)

tryCatch({
  # Task 0 - Create the list of 400 workers, gender and salaries dynamically
  gender = c("Male", "Female")
  salaries = c(7500, 30000)

  # Form a Data Frame joining EmployeeName, EmployeeGender, EmployeeSalary for the 400 workers
  list_of_workers = list_of_workers <- data.frame(
    EmployeeName = paste0("Worker", 1:400),  
    EmployeeGender = sample(gender, 400, replace = TRUE),   # set the size argument to 400
    EmployeeSalary = sample(salaries[1]:salaries[2], 400, replace = TRUE)   # set the size argument to 400
  )

  #Task 1 - Use a loop to generate payment slips for each of the workers
  for (employee_no in 1:nrow(list_of_workers)) {
        worker <- list_of_workers[employee_no, ] #Fetch the row record of ay worker in each iteration
        
        # Check If the salary is greater than $7,500 and less than $30,000 and the employee is female, set the Employee level as "A5-F."
        if (worker$EmployeeGender=="Female" && worker$EmployeeSalary > 7500 && worker$EmployeeSalary < 30000) {
            employee_level <- "A5-F"
            
        # Check if the salary is greater than $10,000 and less than $20,000 and set the Employee level as "A1"
        } else if (worker$EmployeeSalary > 10000 && worker$EmployeeSalary < 20000) {
            employee_level <- "A1"
            
        # If none of the two conditions are met, assign employee as "No Level"
        } else {
            employee_level <- "No level"
        }

        # Form a list and map the employee details
        payment_slip <- list(
            EmployeeName = worker$EmployeeName,
            EmployeeGender = worker$EmployeeGender,
            EmployeeLevel = employee_level,
            EmployeeSalary = worker$EmployeeSalary
        )

        # Pretty Print the output
        print(toJSON(payment_slip, pretty = TRUE))
    }

}, error = function(e) {
  # Error Message
  error_message <- list(message = as.character(e))
  print(error_message, pretty = TRUE)
})



