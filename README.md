# data-analysis-assessment
*A data analysis assessment*

Question 1.
Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.

Approach to each question
For the owner_id: per the description, I reviewed a sample of all tables and confirmed that the 'id' on the users_customuser table is the user original ID and the owner_id in the other tables aligns with it.
name: I used the first name and last name column for the users_customuser table to combine as the 'name' column.
savings_count: Per the discription, is_regular_savings = 1 was used for the Savings column.
investment_count: Also is_a_fund = 1 was used as our Investment column.
total_deposits: The total deposites was from the amount in savings_savingsaccount table

Challenges encountered




