# data-analysis-assessment
# A data analysis assessment*

Question 1.
Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.

# Approach

- **For the owner_id**: per the description, I reviewed a sample of all tables and confirmed that the 'id' on the users_customuser table is the user original ID and the owner_id in the other tables aligns with it.
- **name**: I used the first name and last name column from the users_customuser table to combine as the 'name' column.
- **savings_count**: Per the description,_ is_regular_savings = 1_ was used for the Savings column which was gotten from the plans_plan table.
- **investment_count**: Also _is_a_fund = 1_ was used as our Investment column which was gotten fron the plans_plan table.
- **total_deposits**: The total deposites was from the amount(Kobo) in savings_savingsaccount table
- **Join**: The joins was a combination of the _users_customuser_ and _savings_savingsaccount_ tables then the join of _users_customuser_ and _plans_plan_ table.
# Challenges
I was going to create another table for this query but had to round it all up to one query.


# Question 2.
Calculate the average number of transactions per customer per month and categorize them:
"High Frequency" (≥10 transactions/month)
"Medium Frequency" (3-9 transactions/month)
"Low Frequency" (≤2 transactions/month)              

# Approach
First I had to create the customer column which was the owner_id from the _savings_savingsaccount_ table. Crated a Month_Year column from the transaction_date on the same table and finally created transaction_count from the transaction_status of the _savings_savingsaccount_table then named it all as _monthly_.

From _monthly_, I was able to create_users_customuser.id_, average of the transaction_count from monthly as avg_transaction_count, I was able to case the average monthly transaction_count in to the High, Medium and Low frequency. All from Inner Join of users_customuser  and monthly using users_customuser.id and monthly.owner_id as the join. then Grouped by id from the  users_customuser table. This subquery as named as _categorized_users_

The final query now has the frequency_category, COUNT of id as total_users and avrage of the average transaction_count as overall_avg_transactions

Using this table, 
# Challenges
Craeating the subqueries altogether and having the queries followup with the questions in turn. Especially the average number of transactions per customer per month and categorize them. That was a major challenge. I had to make sure they all build to the final three columns requested. That includs how to manage the Joins for the tables.


# Question 3.
Find all active accounts (savings or investments) with no transactions in the last 1 year (365 days) .

# Approach
Firstly,
I selected plan_id from savings_savingsaccount table, then owner_id from the plans_plan table, then projected the is_regular_savings and is_a_fund which is for both savings and investment column and case this character to reflect when they are to show as Savings, Investments, Savings $ Investment and NULL. Continued with the last transaction date being the maximum transaction_date from the savings_savingsaccount as the last_transaction_date. The final column being the inactive days is derived frm the date difference between the current date and the last_transaction_date.
All this from the join of savings_savingsaccount and plans_plan using plans_plan.owner_id as savings_savingsaccount.owner_id. WHERE savings_savingsaccount.transaction_date IS NOT NULL and grouped by 1,2,3;
# Challenges
I had challenges with not creating a subquery for this quetion and wanted to challenge myself to straighten it.

# Question 4.
For each customer, assuming the profit_per_transaction is 0.1% of the transaction value, calculate:
Account tenure (months since signup)
Total transactions
Estimated CLV (Assume: CLV = (total_transactions / tenure) * 12 * avg_profit_per_transaction)
Order by estimated CLV from highest to lowest

# Approach
With the intention of creating just a query for the whole question, 
- I selected the owner_id from savings_savingsaccount and renamed it as customer_id.
- extracted the first name and last name from the users_customuser table to concat as the name.
- Extracted months from the created_on column on users_customuser which served as the tenure_months
- the count of transaction_status fronm savings_savingsaccount table as total_transactions.
- the formular for the estimated_clv as seen below.
- Inner Join of savings_savingsaccount and users_customuser and grouped by users_customuser.id

# Challenges
The challenges I faced on this question was when trying to get the folumar right for the estimated_clv.
