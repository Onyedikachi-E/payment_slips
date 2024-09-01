# Assignment 1 Project for Course BAN6420 (Programming in Python and R)

"""
Task 0 : Use variables to create a list of workers dynamically (at least 400 workers)
Task 1 : Utilize a for loop to generate payment slips for each of the 400 workers.
Task 2 : Implement the following conditional statements within the for loop:
    If the salary is greater than $10,000 and less than $20,000, assign the Employee level as "A1."
    If the salary is greater than $7,500 and less than $30,000 and the employee is female, set the Employee level as "A5-F."
Task 3 : Add exception handling to your Python code to address potential errors.
Task 4 : Convert your Python code into R.
Task 5 : Package your code into a zipped file and include a README file for submission. Share the zipped file or a link to your GitHub repository.
"""

import random, json

try:
    # Task 0 - Create the list of 400 workers, gender and salaries dynamically
    gender = ["Male", "Female"]
    salaries = (7500, 30000)

    # Form a List joining EmployeeName, EmployeeGender, EmployeeSalary for the 400 workers
    list_of_workers = [("Worker"+str(employee_no), random.choice(gender), random.randint(salaries[0], salaries[1])) for employee_no in range(1, 401)]

    # Task 1 - Use for loop to generate payment slips for each of the workers
    for worker in list_of_workers:

        # Check If the salary is greater than $7,500 and less than $30,000 and the employee is female, set the Employee level as "A5-F."
        if worker[1] == "Female" and  worker[2] in range(7501, 30000):
            employee_level = "A5-F"

        # Check If the salary is greater than $10,000 and less than $20,000, assign the Employee level as "A1."
        elif worker[2] in range(10001, 20000):
            employee_level = "A1"

        # If none of the two conditions are met assign employee as "No Level"
        else:
            employee_level = "No level"
            
        # Form a dictionary and map the employee details
        payment_slip = {
                "EmployeeName" : worker[0],
                "EmployeeGender" : worker[1],
                "EmployeeLevel" : employee_level,
                "EmployeeSalary" : worker[2]
            }
        
        # Pretty Print the output
        print (json.dumps(payment_slip, indent=4))

# Error Handling
except Exception as e:
    # Error Message
    error_message = {"message":str(e)}
    print(error_message)


