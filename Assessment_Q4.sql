SELECT
	savings_savingsaccount.owner_id AS customer_id,
    CONCAT(users_customuser.first_name, ' ', users_customuser.last_name) AS name,
    TIMESTAMPDIFF(MONTH, users_customuser.created_on, CURDATE())AS tenure_months,
    count(transaction_status) as total_transactions,
    (COUNT(savings_savingsaccount.transaction_status) / NULLIF(TIMESTAMPDIFF(MONTH, users_customuser.created_on, CURDATE()), 0)) 
    * 12 
    * (SUM(savings_savingsaccount.amount) / COUNT(savings_savingsaccount.transaction_status) * 0.001) AS estimated_clv
FROM savings_savingsaccount
JOIN users_customuser ON users_customuser.id = savings_savingsaccount.owner_id
GROUP BY users_customuser.id
